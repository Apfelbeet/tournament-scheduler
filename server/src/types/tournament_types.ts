import { TeamId } from "./general_types";

export type Status = {
    started: boolean;
    mode: number;
    winner?: TeamId;
};

export type Key = string;
export type Sync = string;
export type PermissionKey = string;

export enum Permission {
    NONE = 0,
    READ_ONLY = 1,
    EDIT = 2,
    MOD = 3,
    OWNER = 4,
}

export type TournamentAccess = {
    sync: Sync,
    key: Key,
    permissionKeys: PermissionKey[],
}