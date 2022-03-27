import grpc, { ServerWritableStream } from "@grpc/grpc-js";
import { ServerUnaryCall as IN, sendUnaryData as OUT } from "@grpc/grpc-js";
import * as logic from "../logic/server";
import { ServerAPIHandlers } from "../../generated/proto/logicAPI/ServerAPI";
import { Acknowledgment, _logicAPI_Acknowledgment_Status } from "../../generated/proto/logicAPI/Acknowledgment";
import { Modes } from "../../generated/proto/logicAPI/Modes";
import {
    TournamentAccess__Output,
} from "../../generated/proto/logicAPI/TournamentAccess";
import { TournamentCreate__Output } from "../../generated/proto/logicAPI/TournamentCreate";
import { TournamentDetailsList } from "../../generated/proto/logicAPI/TournamentDetailsList";
import * as logger from "../util/logger";
import { ack_error, ack_succ, errorWrapperAck } from "./grpc_util";
import {
    connections,
    sendServerEvent,
    subscriptions,
    removeClosedConnections,
} from "./grpc_connection";
import { ServerEvent } from "../../generated/proto/logicAPI/ServerEvent";
import { Empty__Output } from "../../generated/proto/logicAPI/Empty";

export default class ServerAPI implements ServerAPIHandlers {
    [name: string]: grpc.UntypedHandleCall;

    createTournament(
        call: IN<TournamentCreate__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, () => {
            const key = call.request.key;

            if (key === undefined) {
                callback(null, ack_error("Unspecified key!"));
            } else {
                logic.newTournamentWithKey(key);
                callback(null, ack_succ());
                sendTournaments();
            }
        });
    }

    removeTournament(
        call: IN<TournamentAccess__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const key = call.request.key;

            if (key === undefined) {
                callback(null, ack_error("Unspecified key!"));
            } else {
                await logic.removeTournament(key);

                subscriptions.get(key)?.forEach((call) => {
                    call.write({ error: "Tournament closed!" });
                    call.end();
                });

                subscriptions.set(key, []);
                callback(null, ack_succ());
                sendTournaments();
            }
        });
    }

    getTournaments(
        call: IN<Empty__Output, TournamentDetailsList>,
        callback: OUT<TournamentDetailsList>
    ) {
        try {
            callback(null, { keys: logic.getTournaments() });
        } catch (e) {
            logger.error(`Error occured: ${(e as Error).message}`);
            callback(null, { keys: [] });
        }
    }

    getModes(call: IN<Empty__Output, Modes>, callback: OUT<Modes>) {
        try {
            callback(null, { modes: logic.getModes() });
        } catch (e) {
            logger.error(`Error occured: ${(e as Error).message}`);
            callback(null, { modes: [] });
        }
    }

    connect(call: ServerWritableStream<Empty__Output, ServerEvent>) {
        connections.push(call);
        call.on("close", () => {
            removeClosedConnections();
        });
        logger.log(`New Connection with ${call.getPeer()}.`);
    }

    disconnect(call: IN<Empty__Output, Acknowledgment>, callback: OUT<Acknowledgment>) {
        connections.forEach(connection => {
            if (connection.getPeer() === call.getPeer()) {
                connection.end();
                connection.destroy();
                logger.log(`Connection to ${connection.getPeer()} closed!`);
            }
        });

        removeClosedConnections();
        callback(null, ack_succ());
    }
}

function sendTournaments() {
    sendServerEvent({ tournaments: { keys: logic.getTournaments() } });
}




