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
import { ack_error, ack_succ, convertAccess, errorWrapperAck } from "./grpc_util";
import {
    connections,
    sendServerEvent,
    subscriptions,
    removeClosedConnections,
} from "./grpc_connection";
import { ServerEvent } from "../../generated/proto/logicAPI/ServerEvent";
import { Empty__Output } from "../../generated/proto/logicAPI/Empty";
import { TournamentCreateAcknowledgment } from "../../generated/proto/logicAPI/TournamentCreateAcknowledgment";
import { TournamentAccess } from "../types/tournament_types";

export default class ServerAPI implements ServerAPIHandlers {
    [name: string]: grpc.UntypedHandleCall;

    createTournament(
        call: IN<TournamentCreate__Output, TournamentCreateAcknowledgment>,
        callback: OUT<TournamentCreateAcknowledgment>
    ) {
        try {
            const key = call.request.key;
            let access: TournamentAccess;
            if (key === undefined) {
                access = logic.newTournament();
            } else {
                access = logic.newTournamentWithKey(key);
            }
            callback(null, {access: access});
            sendTournaments();
        } catch (e) {
            callback(null, { error: (e as Error).message });
        }
    }

    removeTournament(
        call: IN<TournamentAccess__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request);

            if (access.key === undefined) {
                callback(null, ack_error("Unspecified key!"));
            } else {
                await logic.removeTournament(access);

                subscriptions.get(access.key)?.forEach((call) => {
                    call.write({ error: "Tournament closed!" });
                    call.end();
                });

                subscriptions.set(access.key, []);
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




