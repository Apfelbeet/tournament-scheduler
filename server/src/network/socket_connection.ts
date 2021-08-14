import * as websocket from "websocket";
import * as logic from "../logic/server";
import * as http from "http";
import { Key, Sync } from "../types/general_types";
import { ClientMessage, DataType, DataTypeString } from "../types/socket_types";
import { OutOfSyncError } from "../util/errors"
import * as logger from "../util/logger";

const subscriptions = new Map<Key, websocket.connection[]>();
let httpServer;
let wsServer;

export function init(port: number) {
    httpServer = http.createServer();
    httpServer.listen(port);
    wsServer = new websocket.server({
        httpServer: httpServer,
        autoAcceptConnections: false,
    });

    wsServer.on("request", onRequest);
    logger.success(`Socket is listening on ${port}!`);
}

export function originIsAllowed(origin: string): boolean {
    return true;
}

export function onRequest(request: websocket.request) {
    if (!originIsAllowed(request.origin)) {
        request.reject();
        logger.warn(`Connection rejected: ${request.origin}`);
        return;
    }

    const connection = request.accept("echo-protocol", request.origin);
    logger.log(`Connection accepted: ${connection.remoteAddress}`);

    connection.on("message", (message) => {
        if (message.type === "utf8") {
            logger.net(`Message received from ${connection.remoteAddress}:\n${message.utf8Data}`);
            let json_message = JSON.parse(message.utf8Data);
            parseReceivedMessage(json_message, connection);
        }
    });

    connection.on("close", (reasonCode, description) => {
        logger.log(`${connection.remoteAddress} disconnected!`);
    });
}

export function sendTournamentData(
    key: Key,
    syncNew: Sync,
    syncOld: Sync,
    dataType: DataTypeString,
    data: DataType
) {
    if (!subscriptions.has(key)) {
        throw new Error(`couldn't find tournament with key: ${key}`);
    }

    const connections = subscriptions.get(key);

    const m = JSON.stringify({
        type: "tournamentData",
        key: key,
        sync: syncNew,
        syncOld: syncOld,
        dataType: dataType,
        data: data,
    });

    connections!.forEach((c: websocket.connection) => {
        send(c, m);
    });
}

export function sendTeams(key: Key, syncNew: Sync, syncOld: Sync) {
    sendTournamentData(
        key,
        syncNew,
        syncOld,
        "team",
        logic.getTeamsFromTournament(key)
    );
}

export function sendStatus(key: Key, syncNew: Sync, syncOld: Sync) {
    sendTournamentData(
        key,
        syncNew,
        syncOld,
        "status",
        logic.getStatusFromTournament(key)
    );
}

export function sendStructure(key: Key, syncNew: Sync, syncOld: Sync) {
    sendTournamentData(
        key,
        syncNew,
        syncOld,
        "structure",
        logic.getStructureFromTournament(key)
    );
}

export function sendAll(key: Key, connection: websocket.connection) {
    send(
        connection,
        JSON.stringify({
            type: "allTournamentData",
            key: key,
            data: {
                sync: logic.getTournament(key).sync,
                teams: logic.getTeamsFromTournament(key),
                modules: logic.getStatusFromTournament(key).started ? logic.getStructureFromTournament(key) : "",
                status: logic.getStatusFromTournament(key),
            },
        })
    );
}

export function sendTournaments(connection: websocket.connection) {
    send(
        connection,
        JSON.stringify({
            type: "tournaments",
            data: logic.getTournaments(),
        })
    );
}

export function sendModes(connection: websocket.connection) {
    send(
        connection,
        JSON.stringify({
            type: "modes",
            data: logic.getModes().map((m) => {
                return { id: m.id, title: m.title, description: m.description };
            }),
        })
    );
}

export function sendError(connection: websocket.connection, message: string) {
    send(
        connection,
        JSON.stringify({
            type: "error",
            message: message,
        })
    );
}

export function send(connection: websocket.connection, message: string) {
    logger.net(`Send Message to: ${connection.remoteAddress}:\n${message}`);
    connection.sendUTF(message);
}

export function parseReceivedMessage(
    message: ClientMessage,
    connection: websocket.connection
) {
    try {
        /*
            Create new tournament

            {
            type: "createTournament"
            [key: <String>}
            }

         */

        if (message.type === "createTournament") {
            if (message.key === undefined) {
                logic.newTournament();
            } else {
                logic.newTournamentWithKey(message.key);
            }
            sendTournaments(connection);
        } else if (message.type === "getTournaments") {
            /*
        {type: "getTournament"}
         */
            sendTournaments(connection);
        } else if (message.type === "getModes") {
            /*
             * {type: "getModes"}
             */
            sendModes(connection);
        } else if (message.type === "subscribe") {
            /*
            Subscribing to all events of the tournament:
            If the data changes, the client will get a notification. (e.g. "tournamentData")

            {
            type : "subscribe",
            key : <tournamentKey>
            }
            */
            if (logic.tournamentExists(message.key)) {
                if (!subscriptions.has(message.key)) {
                    subscriptions.set(message.key, []);
                }

                subscriptions.get(message.key)!.push(connection);
                logger.log(`${connection.remoteAddress} subscribed to ${message.key}`);
            }
        } else if (message.type === "unsubscribe") {
            /*
            Unsubscribe a tournament. No new notification will be send.

            {
            type: "unsubscribe",
            key: <tournamentKey>,
            }

         */
            if (
                logic.tournamentExists(message.key) &&
                subscriptions.has(message.key)
            ) {
                subscriptions.get(message.key)!.filter((c) => c !== connection);
                logger.log(`${connection.remoteAddress} unsubscribed from ${message.key}`);
            }
        } else if (message.type === "requestAll") {
            /*
            Request all data of an tournament to allow new clients to get all previous changes or to resynchronise clients.
            The server will return all data as described in sendAll() if the given tournament key is valid.

            {
            type: "requestAll",
            key: <tournamentKey>
            }
         */
            sendAll(message.key, connection);
        } else if (message.type === "start") {
            /*
        {
        type: "start"
        key: <tournamentKey>
        sync: <Int>
        }
         */
            logic.startTournament(message.key, message.sync);
        } else if (message.type === "reset") {
            /*
        {
        type: "reset"
        key: <tournamentKey>
        sync: <Int>
        }
         */
            logic.resetTournament(message.key, message.sync);
        } else if (message.type === "addTeam") {
            /*
        {
        type: "reset"
        key: <tournamentKey>
        sync: <Int>
        name: <String>
        }
         */
            logic.addTeamToTournament(
                message.key,
                message.sync,
                message.name
            );
        } else if (message.type === "removeTeam") {
            /*
        {
        type: "removeTeam"
        key: <tournamentKey>
        sync: <Int>
        id: <Int>
        }
         */
            logic.removeTeamFromTournament(
                message.key,
                message.sync,
                parseInt(message.id, 10)
            );
        } else if (message.type === "setMode") {
            /*
        {
        type: "setMode"
        key: <tournamentKey>
        sync: <Int>
        id: <Int>
        }
         */
            logic.setModeOfTournament(
                message.key,
                message.sync,
                parseInt(message.id, 10)
            );
        } else if (message.type === "setResult") {
            /*
        {
        type: "setResult",
        key: <tournamentKey>
        sync: <Int>
        gameId: <Int>
        resultA: <Int>
        resultB: <Int>
        }
         */
            logic.setResult(
                message.key,
                message.sync,
                parseInt(message.gameId, 10),
                parseInt(message.resultA, 10),
                parseInt(message.resultB)
            );
        }
    } catch (e) {
        if (e instanceof OutOfSyncError) {
            logger.error(`${connection.remoteAddress} is out of sync!`);
            send(connection, JSON.stringify({ type: "syncError" }));
        } else {
            logger.error(`connection.remoteAddress caused: ${(e as Error).message}`)
            sendError(connection, (e as Error).message);
        }
    }
}
