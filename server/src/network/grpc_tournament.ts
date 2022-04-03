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
import {
    ack_error,
    ack_succ,
    errorWrapperAck,
    convertStructure,
    convertAccess,
} from "./grpc_util";
import {
    removeClosedSubscriptions,
    sendTournamentEvent,
    subscriptions,
} from "./grpc_connection";
import * as logger from "../util/logger";
import { Permission } from "../../generated/proto/logicAPI/PERMISSION";
import { PermissionQuery__Output } from "../../generated/proto/logicAPI/PermissionQuery";
import { RemovePermissionKey__Output } from "../../generated/proto/logicAPI/RemovePermissionKey";
import { SetPermission__Output } from "../../generated/proto/logicAPI/SetPermission";
import { Permission as PERMISSION, Sync, TournamentAccess } from "../types/tournament_types";
import { KeyPermissionPairs } from "../../generated/proto/logicAPI/KeyPermissionPairs";

export default class TournamentAPI implements TournamentAPIHandlers {
    [name: string]: grpc.UntypedHandleCall;

    addTeam(
        call: IN<TeamAdd__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request.access);
            const name = call.request.name;

            if (
                name === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.addTeamToTournament(
                    convertAccess(access),
                    name
                );
                callback(null, ack_succ());
                sendTeams(access, sk);
            }
        });
    }

    editTeam(
        call: IN<TeamEdit__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request.access);
            const name = call.request.name;
            const id = call.request.id;

            if (
                name === undefined ||
                id === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.editTeamInTournament(
                    access,
                    id,
                    name
                );
                callback(null, ack_succ());
                sendTeams(access, sk);
            }
        });
    }

    removeTeam(
        call: IN<TeamRemove__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request.access);
            const id = call.request.id;

            if (
                id === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.removeTeamFromTournament(
                    access,
                    id
                );
                callback(null, ack_succ());
                sendTeams(access, sk);
            }
        });
    }

    async load(
        call: IN<TournamentAccess__Output, ResponseTournamentData>,
        callback: OUT<ResponseTournamentData>
    ) {
        try {
            const access = convertAccess(call.request);

            if (access === undefined) {
                callback(null, { error: "Bad Arguments!" });
            } else {
                const tournament = await logic.getTournament(access.key);

                const stru = convertStructure(
                    await logic.getModuleStructuresFromTournament(access)
                );

                const data = {
                    key: access.key,
                    sync: tournament.sync,
                    status: await logic.getStatusFromTournament(access),
                    teams: {
                        teams: await logic.getTeamsFromTournament(access),
                    },
                    structure: {
                        structures: stru !== undefined ? stru : [],
                    },
                };

                callback(null, { data: data });
            }
        } catch (e) {
            logger.error((e as Error).message);
            callback(null, { error: (e as Error).message });
        }
    }

    setMode(
        call: IN<SetMode__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request.access);
            const id = call.request.id;

            if (
                id === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.setModeOfTournament(
                    access,
                    id
                );
                callback(null, ack_succ());
                sendStatus(access, sk);
            }
        });
    }

    setResult(
        call: IN<SetResult__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request.access);
            const game = call.request.game;

            if (
                game === undefined ||
                game.id === undefined ||
                game.scoreA === undefined ||
                game.scoreB === undefined
            ) {
                callback(null, ack_error("Bad Arguments!"));
            } else {
                const [osk, sk] = await logic.setResult(
                    access,
                    game.id,
                    game.scoreA,
                    game.scoreB
                );
                callback(null, ack_succ());
                sendStructure(access, sk);
                sendStatus(access, sk);
            }
        });
    }

    start(
        call: IN<TournamentAccess__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request);


            const [osk, sk] = await logic.startTournament(
                access,
            );
            callback(null, ack_succ());
            sendStatus(access, sk);
            sendStructure(access, sk);
        });
    }

    reset(
        call: IN<TournamentAccess__Output, Acknowledgment>,
        callback: OUT<Acknowledgment>
    ) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request);


            const [osk, sk] = await logic.resetTournament(
                access
            );
            callback(null, ack_succ());
            sendStatus(access, sk);
            sendStructure(access, sk);
            
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

    setPermission(call: IN<SetPermission__Output, Acknowledgment>, callback: OUT<Acknowledgment>) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request.access);
            const permissionKey = call.request.permissionKey;
            const permission = call.request.permission;

            if (permission === undefined || permissionKey === undefined) {
                throw new Error("Bad arguments!");
            } else {
                await logic.setPermission(access, permissionKey, permission);
                callback(null, ack_succ());
            }
        });
    }

    async removePermissionKey(call: IN<RemovePermissionKey__Output, Acknowledgment>, callback: OUT<Acknowledgment>) {
        errorWrapperAck(callback, async () => {
            const access = convertAccess(call.request.access);
            const permissionKey = call.request.permissionKey;

            if (permissionKey === undefined) {
                throw new Error("Bad arguments!");
            } else {
                await logic.removePermission(access, permissionKey);
                callback(null, ack_succ());
            }
        });
    }

    async getPermission(call: IN<TournamentAccess__Output, Permission>, callback: OUT<Permission>) {
        try {
            const access = convertAccess(call.request);
            const permission = await logic.getPermission(access);
            callback(null, { permission: permission });
        } catch (e) {
            logger.error(`API Error ${(e as Error).message}`);
            callback(null, {permission: PERMISSION.NONE});
        }
    }

    async getPermissionManagement(call: IN<TournamentAccess__Output, KeyPermissionPairs>, callback: OUT<KeyPermissionPairs>) {
        try {
            const access = convertAccess(call.request);
            const pairs = await logic.getPermissionKeys(access);
            callback(null, {pairs: pairs.map(([k, p]) => { return {key: k, permission: p}})});
        } catch (e) {
            logger.error(`API Error ${(e as Error).message}`);
            callback(null, {pairs: []});
        }
    }

    async getPermissionOfKey(call: IN<PermissionQuery__Output, Permission>, callback: OUT<Permission>) {
        try {
            const access = convertAccess(call.request.access);
            const permissionKey = call.request.permissionKey;

            if (permissionKey === undefined)
                throw new Error("Bad arguments!");
            else {
                const permission = await logic.getPermissionOfKey(access, permissionKey);
                callback(null, { permission: permission });
            }
        } catch (e) {
            logger.error(`API Error ${(e as Error).message}`);
            callback(null, {permission: PERMISSION.NONE});
        }
    }


}

async function sendTeams(access: TournamentAccess, syncNew: Sync) {
    sendTournamentEvent(access.key, {
        key: access.key,
        sync: syncNew,
        syncOld: access.sync,
        teams: { teams: await logic.getTeamsFromTournament(access) },
    });
}

async function sendStatus(access: TournamentAccess, syncNew: Sync) {
    sendTournamentEvent(access.key, {
        key: access.key,
        sync: syncNew,
        syncOld: access.sync,
        status: await logic.getStatusFromTournament(access),
    });
}

async function sendStructure(access: TournamentAccess, syncNew: Sync) {
    sendTournamentEvent(access.key, {
        key: access.key,
        sync: syncNew,
        syncOld: access.sync,
        structure: {
            structures: convertStructure(
                await logic.getModuleStructuresFromTournament(access)
            ),
        },
    });
}
