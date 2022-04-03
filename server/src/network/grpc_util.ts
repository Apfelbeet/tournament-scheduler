import { Acknowledgment, _logicAPI_Acknowledgment_Status as ACK_STATUS } from "../../generated/proto/logicAPI/Acknowledgment";
import { ServerUnaryCall as IN, sendUnaryData as OUT } from "@grpc/grpc-js";
import { OutOfSyncError } from "../util/errors";
import * as logger from "../util/logger";
import { Structure } from "../types/module_types";
import { StructureData } from "../../generated/proto/logicAPI/StructureData";
import { TournamentAccess } from "../types/tournament_types";
import { TournamentAccess__Output } from "../../generated/proto/logicAPI/TournamentAccess";


export function ack_error(message: string): Acknowledgment {
    return {
        status: ACK_STATUS.ERRROR,
        message: message
    }
}

export function ack_sync(): Acknowledgment {
    return {
        status: ACK_STATUS.SYNC_ERROR,
    }
}

export function ack_succ(): Acknowledgment {
    return {
        status: ACK_STATUS.OK,
    }
}

export async function errorWrapperAck(callback: OUT<Acknowledgment>, run: (() => void)) {
    try {
        await run();
    } catch (e) {
        if (e instanceof OutOfSyncError) {
            //TODO: pass connection id for logging
            logger.error("Out of sync error occured!");
            callback(null, ack_sync());
        } else {
            logger.error(`Error occured: ${(e as Error).message}`);
            callback(null, ack_error((e as Error).message));
        }
    }
}

export function convertStructure(structures?: Structure[]): StructureData[] | undefined {
    return structures?.map((st) => {
        return {
            id: st.id,
            type: st.type,
            label: st.label,
            visible: st.visible,
            state: st.state,
            stats: st.stats,
            data: JSON.stringify(st.data),
            modules: st.modules,
            games: st.games,
            down: st.down,
            up: st.up,
        }
    });
}

export function convertAccess(access?: TournamentAccess__Output): TournamentAccess {
    if (access === undefined || access.key === undefined || access.permissionKeys === undefined || access.sync === undefined)
        throw new Error("Missing keys for access!");
    else
        return {
            key: access.key,
            sync: access.sync,
            permissionKeys: access.permissionKeys,
        };
}