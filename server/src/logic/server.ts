import { Team, Mode, TeamId, PermissionStorage } from "../types/general_types";
import {
    Key,
    Permission,
    PermissionKey,
    Status,
    Sync,
    TournamentAccess,
} from "../types/tournament_types";
import { randomKey } from "../util/util";
import { Tournament, newSync } from "./tournament";
import { Structure } from "../types/module_types";
import {
    OutOfSyncError,
    PermissionError,
    UnknownTournamentError,
} from "../util/errors";
import Game from "./generation_modules/game_module";
import * as config from "./server_config";
import * as logger from "../util/logger";
import * as database from "../database/database";
import * as network from "../network/grpc_connection";

const tournaments = new Map<string, Tournament>();
let modes: Mode[] = [];
let existing_tournaments: Key[] = [];
let permissions: Map<Key, PermissionStorage> = new Map();

export async function init() {
    modes = config.getModes();
    existing_tournaments = await database.getTournamentKeys();
    permissions = await database.getPermissions();
    logger.success("Logic initialized!");
}

export function newTournamentWithKey(key: Key): TournamentAccess {
    if (tournamentExists(key)) {
        throw new Error(`${key} is already in use!`);
    }

    existing_tournaments.push(key);

    const t: Tournament = new Tournament();

    tournaments.set(key, t);

    const perm = new Map();
    perm.set("", Permission.READ_ONLY);
    perm.set(randomKey(10), Permission.OWNER);
    permissions.set(key, perm);

    database.storeTournament(key, t);
    database.storePermission(key, perm);
    logger.success(`New Tournament with key: ${key}`);
    return {
        key: key,
        sync: "",
        permissionKeys: Array.from(perm, ([key, _]) => key),
    };
}

export function newTournament(): TournamentAccess {
    let key = randomKey(5);
    for (let i = 0; i < 10 && tournamentExists(key); i++) {
        key = randomKey(5);
    }
    return newTournamentWithKey(key);
}

export async function removeTournament(access: TournamentAccess) {
    await checkPermission(access, Permission.OWNER);

    if (tournamentExists(access.key)) {
        database.removeTournament(access.key);
        database.removePermission(access.key);
        tournaments.delete(access.key);
        existing_tournaments = existing_tournaments.filter(
            (k) => k !== access.key
        );
        logger.log(`${access.key} removed!`);
    }
}

export function tournamentExists(key: Key): boolean {
    return existing_tournaments.includes(key);
}

export async function getTournament(key: Key): Promise<Tournament> {
    if (!tournamentExists(key)) {
        throw new UnknownTournamentError();
    }

    if (tournaments.has(key)) {
        return tournaments.get(key)!;
    } else {
        const t: Tournament = await database.loadTournament(key);
        tournaments.set(key, t);
        return t;
    }
}

export function getMode(id: number): Mode {
    let mode = modes.find((element) => element.id.toString() === id.toString());

    if (mode) {
        return mode;
    } else {
        throw new Error(`no mode with id ${id} was found!`);
    }
}

export function getModes(): Mode[] {
    return modes;
}

export async function getModeFromTournament(
    access: TournamentAccess
): Promise<Mode | undefined> {
    await checkPermission(access, Permission.READ_ONLY);
    return (await getTournament(access.key)).mode;
}

export async function getStatusFromTournament(
    access: TournamentAccess
): Promise<Status> {
    await checkPermission(access, Permission.READ_ONLY);
    const t: Tournament = await getTournament(access.key);

    return {
        started: t.isStarted(),
        mode: t.mode ? t.mode!.id : -1,
        winner: t.winner,
    };
}

export async function getModuleStructuresFromTournament(
    access: TournamentAccess
): Promise<Structure[] | undefined> {
    await checkPermission(access, Permission.READ_ONLY);
    const t: Tournament = await getTournament(access.key);

    return t.isStarted() ? t.getModuleStructures() : undefined;
}

export async function getTeamsFromTournament(
    access: TournamentAccess
): Promise<Team[]> {
    await checkPermission(access, Permission.READ_ONLY);
    return (await getTournament(access.key)).getTeams();
}

export function getTournaments(): Key[] {
    return existing_tournaments;
}

export async function checkSync(access: TournamentAccess): Promise<void> {
    if ((await getTournament(access.key)).sync !== access.sync) {
        throw new OutOfSyncError();
    }
}

async function useSync(access: TournamentAccess): Promise<[Key, Key]> {
    const t: Tournament = await getTournament(access.key);
    return [t.sync, (t.sync = newSync())];
}

export async function addTeamToTournament(
    access: TournamentAccess,
    name: string
): Promise<[Sync, Sync]> {
    await checkPermission(access, Permission.MOD);
    await checkSync(access);

    const t: Tournament = await getTournament(access.key);

    if (!name) {
        throw new Error("invalid name!");
    } else if (t.isStarted()) {
        throw new Error("currently no team can be added!");
    }

    t.addTeam(name);
    const syncs = await useSync(access);

    logger.log(`added team: ${name} to ${access.key}`);
    database.storeTournament(access.key, t);
    return syncs;
}

export async function editTeamInTournament(
    access: TournamentAccess,
    teamId: TeamId,
    name: string
): Promise<[Sync, Sync]> {
    await checkPermission(access, Permission.MOD);
    await checkSync(access);

    const t: Tournament = await getTournament(access.key);

    t.editTeam(teamId, name);
    const syncs = await useSync(access);

    logger.log(`${access.key}: change team name from ${teamId} to ${name}`);
    database.storeTournament(access.key, t);
    return syncs;
}

export async function removeTeamFromTournament(
    access: TournamentAccess,
    id: TeamId
): Promise<[Sync, Sync]> {
    await checkPermission(access, Permission.MOD);
    await checkSync(access);

    const t: Tournament = await getTournament(access.key);

    if (id === undefined) {
        throw new Error("invalid id!");
    } else if (t.isStarted()) {
        throw new Error("currently no team can be removed!");
    }

    t.removeTeam(id);
    const syncs = await useSync(access);

    logger.log(`removed team: ${id} from ${access.key}`);
    database.storeTournament(access.key, t);
    return syncs;
}

export async function setModeOfTournament(
    access: TournamentAccess,
    mode: number
): Promise<[Sync, Sync]> {
    await checkPermission(access, Permission.MOD);
    await checkSync(access);

    const t: Tournament = await getTournament(access.key);
    t.setMode(getMode(mode));
    const syncs = await useSync(access);

    logger.log(`set mode of ${access.key} to ${mode}`);
    database.storeTournament(access.key, t);
    return syncs;
}

export async function startTournament(
    access: TournamentAccess
): Promise<[Sync, Sync]> {
    await checkPermission(access, Permission.MOD);
    await checkSync(access);

    const t: Tournament = await getTournament(access.key);
    t.invoke();
    const syncs = await useSync(access);

    logger.success(`${access.key} started!`);
    database.storeTournament(access.key, t);
    return syncs;
}

export async function resetTournament(
    access: TournamentAccess
): Promise<[Sync, Sync]> {
    await checkPermission(access, Permission.MOD);
    await checkSync(access);

    const t: Tournament = await getTournament(access.key);
    t.reset();
    const syncs = await useSync(access);

    logger.success(`${access.key} stopped!`);
    database.storeTournament(access.key, t);
    return syncs;
}

export async function setResult(
    access: TournamentAccess,
    game_id: number,
    resultA: number,
    resultB: number
): Promise<[Sync, Sync]> {
    await checkPermission(access, Permission.EDIT);
    await checkSync(access);

    const t: Tournament = await getTournament(access.key);
    const ow = t.winner;
    t.setResult(game_id, resultA, resultB);
    const syncs = await useSync(access);

    const game: Game = t.search(game_id) as Game;
    logger.log(
        `new result for ${access.key}: + ${game.upstream_teams[0]}("${
            t.getTeam(game.upstream_teams[0])?.name ?? ""
        }") ${resultA}-${resultB} ${game.upstream_teams[1]}("${
            t.getTeam(game.upstream_teams[1])?.name ?? ""
        }")`
    );

    if (t.winner !== ow) {
        if (t.winner !== undefined)
            logger.success(
                `${access.key}: ${t.getTeam(t.winner!)!.name} wins!`
            );
    }
    database.storeTournament(access.key, t);
    return syncs;
}

export async function unloadInactiveTournament(access: TournamentAccess) {
    if (!network.hasSubscription(access.key) && tournaments.has(access.key)) {
        logger.log(`${access.key}: Unload tournament data`);
        database.storeTournament(access.key, await getTournament(access.key));
        tournaments.delete(access.key);
    }
}

export function setPermission(
    access: TournamentAccess,
    key: PermissionKey,
    permission: Permission
) {
    checkPermission(access, Permission.OWNER);

    permissions.get(access.key)?.set(key, permission);
    database.storePermission(access.key, permissions.get(access.key)!);
}

export function removePermission(
    access: TournamentAccess,
    key: PermissionKey
) {
    checkPermission(access, Permission.OWNER);

    permissions.get(access.key)?.delete(key);
    database.storePermission(access.key, permissions.get(access.key)!);
}

export function getPermissionOfKey(
    access: TournamentAccess,
    permissionKey: PermissionKey
): Permission {
    checkPermission(access, Permission.NONE);

    const tournament_perm = permissions.get(access.key);

    if (tournament_perm === undefined) throw new UnknownTournamentError();

    const perm = tournament_perm.get(permissionKey);

    if (perm === undefined) return Permission.NONE;
    else return perm;
}

export function getPermissionKeys(
    access: TournamentAccess
): [PermissionKey, Permission][] {
    checkPermission(access, Permission.OWNER);
    //await checkSync(access);

    const tournament_perm = permissions.get(access.key);
    if (tournament_perm === undefined) throw new UnknownTournamentError();

    const result: [PermissionKey, Permission][] = [];
    for (let x of tournament_perm) {
        result.push(x);
    }
    return result;
}

async function checkPermission(
    access: TournamentAccess,
    permission: Permission
) {
    const storedPermission = getPermission(access);
    if (storedPermission < permission) throw new PermissionError();
}

export function getPermission(
    access: TournamentAccess
): Permission {    
    const tournament_perm = permissions.get(access.key);
    if (tournament_perm === undefined) throw new UnknownTournamentError();

    const defaultPermission: Permission = tournament_perm.has("")
        ? tournament_perm.get("")!
        : Permission.NONE;

    let maxPermission: Permission = defaultPermission;
    for (let key of access.permissionKeys) {
        const perm = tournament_perm.get(key);
        if (perm !== undefined && perm > maxPermission) maxPermission = perm;
    }

    return maxPermission;
}