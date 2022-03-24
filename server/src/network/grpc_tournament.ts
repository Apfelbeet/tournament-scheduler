import grpc, { ServerWritableStream } from "@grpc/grpc-js";
import { ServerUnaryCall as IN, sendUnaryData as OUT } from "@grpc/grpc-js";
import { Acknowledgment } from "../../generated/proto/logicAPI/Acknowledgment";
import { ResponseTournamentData } from "../../generated/proto/logicAPI/ResponseTournamentData";
import { SetMode__Output } from "../../generated/proto/logicAPI/SetMode";
import { SetResult__Output } from "../../generated/proto/logicAPI/SetResult";
import { TeamAdd__Output } from "../../generated/proto/logicAPI/TeamAdd";
import { TeamEdit__Output } from "../../generated/proto/logicAPI/TeamEdit";
import { TeamRemove__Output } from "../../generated/proto/logicAPI/TeamRemove";
import { TournamentAccess__Output } from "../../generated/proto/logicAPI/TournamentAccess";
import { TournamentAPIHandlers } from "../../generated/proto/logicAPI/TournamentAPI";
import { TournamentEvent } from "../../generated/proto/logicAPI/TournamentEvent";
import * as logic from "../logic/server";
import { Key, Sync } from "../types/general_types";
import {
    ack_error,
    ack_succ,
    errorWrapperAck,
    convertStructure,
} from "./grpc_util";
import {
    connections,
    removeClosedSubscriptions,
    sendTournamentEvent,
    subscriptions,
} from "./grpc_connection";
import * as logger from "../util/logger";

export default class TournamentAPI implements TournamentAPIHandlers {
    [name: string]: grpc.UntypedHandleCall;

    addTeam(
        call: IN<TeamAdd__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = call.request.access;
            const name = call.request.name;

            if (
                access === undefined ||
                name === undefined ||
                access.key === undefined ||
                access.sync === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.addTeamToTournament(
                    access.key,
                    access.sync,
                    name
                );
                callback(null, ack_succ());
                sendTeams(access.key, sk, osk);
            }
        });
    }

    editTeam(
        call: IN<TeamEdit__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = call.request.access;
            const name = call.request.name;
            const id = call.request.id;

            if (
                access === undefined ||
                name === undefined ||
                id === undefined ||
                access.key === undefined ||
                access.sync === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.editTeamInTournament(
                    access.key,
                    access.sync,
                    id,
                    name
                );
                callback(null, ack_succ());
                sendTeams(access.key, sk, osk);
            }
        });
    }

    removeTeam(
        call: IN<TeamRemove__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = call.request.access;
            const id = call.request.id;

            if (
                access === undefined ||
                id === undefined ||
                access.key === undefined ||
                access.sync === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.removeTeamFromTournament(
                    access.key,
                    access.sync,
                    id
                );
                callback(null, ack_succ());
                sendTeams(access.key, sk, osk);
            }
        });
    }

    async load(
        call: IN<TournamentAccess__Output, ResponseTournamentData>,
        callback: OUT<ResponseTournamentData>
    ) {
        try {
            const access = call.request;

            if (access === undefined || access.key === undefined) {
                callback(null, { error: "Bad Arguments!" });
            } else {
                const tournament = await logic.getTournament(access.key);

                const stru = convertStructure(
                    await logic.getModuleStructuresFromTournament(access.key)
                );

                const data = {
                    key: access.key,
                    sync: tournament.sync,
                    status: await logic.getStatusFromTournament(access.key),
                    teams: {
                        teams: await logic.getTeamsFromTournament(access.key),
                    },
                    structure: {
                        structures: stru !== undefined ? stru : [],
                    },
                };

                callback(null, { data: data });
            }
        } catch (e) {
            callback(null, { error: (e as Error).message });
        }
    }

    setMode(
        call: IN<SetMode__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = call.request.access;
            const id = call.request.id;

            if (
                access === undefined ||
                id === undefined ||
                access.key === undefined ||
                access.sync === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.setModeOfTournament(
                    access.key,
                    access.sync,
                    id
                );
                callback(null, ack_succ());
                sendStatus(access.key, sk, osk);
            }
        });
    }

    setResult(
        call: IN<SetResult__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = call.request.access;
            const game = call.request.game;

            if (
                access === undefined ||
                access.key === undefined ||
                access.sync === undefined ||
                game === undefined ||
                game.id === undefined ||
                game.scoreA === undefined ||
                game.scoreB === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.setResult(
                    access.key,
                    access.sync,
                    game.id,
                    game.scoreA,
                    game.scoreB
                );
                callback(null, ack_succ());
                sendStructure(access.key, sk, osk);
                sendStatus(access.key, sk, sk);
            }
        });
    }

    start(
        call: IN<TournamentAccess__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = call.request;

            if (
                access === undefined ||
                access.key === undefined ||
                access.sync === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.startTournament(
                    access.key,
                    access.sync
                );
                callback(null, ack_succ());
                sendStatus(access.key, sk, osk);
                sendStructure(access.key, sk, sk);
            }
        });
    }

    reset(
        call: IN<TournamentAccess__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = call.request;

            if (
                access === undefined ||
                access.key === undefined ||
                access.sync === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.resetTournament(
                    access.key,
                    access.sync
                );
                callback(null, ack_succ());
                sendStatus(access.key, sk, osk);
                sendStructure(access.key, sk, sk);
            }
        });
    }

    subscribe(
        call: ServerWritableStream<TournamentAccess__Output, TournamentEvent>
    ) {
        const access = call.request;

        //No checking for sync
        if (access === undefined || access.key === undefined) {
            call.write({ error: "Tournament does not exist!" });
            call.end();
        } else {
            if (!subscriptions.has(access.key)) {
                subscriptions.set(access.key, []);
            }
            logger.log(`${access.key}: ${call.getPeer()} subscribed.`);
            subscriptions.get(access.key)?.push(call);

            call.on("close", () => {
                logger.error("HELLO CLOSE!")
                removeClosedSubscriptions(access.key!);
            });
        }
    }

    unsubscribe(
        call: IN<TournamentAccess__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        const access = call.request;

        if (access === undefined || access.key === undefined) {
            callback(null, ack_error("Bad Arguments!"));
        } else {
            if (subscriptions.has(access.key)) {

                subscriptions
                    .get(access.key)!
                    .forEach((connection) => {
                        if (connection.getPeer() === call.getPeer()) {
                            connection.end();
                            connection.destroy();
                            logger.log(
                                `${access.key}: ${connection.getPeer()} unsubscribed.`
                            );
                        }
                    });
                
                callback(null, ack_succ());
            } else {
                callback(null, ack_error(`${access.key} is unknown.`));
            }
        }        
    }
}

async function sendTeams(key: Key, syncNew: Sync, syncOld: Sync) {
    sendTournamentEvent(key, {
        key: key,
        sync: syncNew,
        syncOld: syncOld,
        teams: { teams: await logic.getTeamsFromTournament(key) },
    });
}

async function sendStatus(key: Key, syncNew: Sync, syncOld: Sync) {
    sendTournamentEvent(key, {
        key: key,
        sync: syncNew,
        syncOld: syncOld,
        status: await logic.getStatusFromTournament(key),
    });
}

async function sendStructure(key: Key, syncNew: Sync, syncOld: Sync) {
    sendTournamentEvent(key, {
        key: key,
        sync: syncNew,
        syncOld: syncOld,
        structure: {
            structures: convertStructure(
                await logic.getModuleStructuresFromTournament(key)
            ),
        },
    });
}
