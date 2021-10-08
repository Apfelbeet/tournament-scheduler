import { Key, Team, Mode, Sync, TeamId } from "../types/general_types";
import { Status } from "../types/tournament_types";
import { randomKey } from "../util/util";
import { Tournament, newSync } from "./tournament";
import { Structure } from "../types/module_types";
import { OutOfSyncError } from "../util/errors";
import Game from "./generation_modules/game_module";
import * as config from "./server_config";
import * as socket from "../network/socket_connection";
import * as logger from "../util/logger";
import * as database from "../database/database";

const tournaments = new Map<string, Tournament>();
let modes: Mode[] = [];
let existing_tournaments: Key[] = [];

export async function init() {
    modes = config.getModes();
    existing_tournaments = await database.getTournamentKeys();
    logger.success("Logic initialized!");
}

export function newTournamentWithKey(key: Key): Key {
    if (tournamentExists(key)) {
        throw new Error(`${key} is already in use!`);
    }

    existing_tournaments.push(key);

    const t: Tournament = new Tournament();

    tournaments.set(key, t);
    database.storeTournament(key, t);
    logger.success(`New Tournament with key: ${key}`);
    return key;
}

export function newTournament(): Key {
    let key = randomKey(5);
    for (let i = 0; i < 10 && tournamentExists(key); i++) {
        key = randomKey(5);
    }
    return newTournamentWithKey(key);
}

export function tournamentExists(key: Key): boolean {
    return existing_tournaments.includes(key);
}

export async function getTournament(key: Key): Promise<Tournament> {
    if (!tournamentExists(key)) {
        throw new Error(`tournament with key ${key} does not exist!`);
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
    key: Key
): Promise<Mode | undefined> {
    return (await getTournament(key)).mode;
}

export async function getStatusFromTournament(key: Key): Promise<Status> {
    const t: Tournament = await getTournament(key);

    return {
        started: t.isStarted(),
        mode: t.mode ? t.mode!.id : -1,
        winner: t.winner,
    };
}

export async function getModuleStructuresFromTournament(
    key: Key
): Promise<Structure[] | undefined> {
    const t: Tournament = await getTournament(key);

    return t.isStarted() ? t.getModuleStructures() : undefined;
}

export async function getTeamsFromTournament(key: Key): Promise<Team[]> {
    return (await getTournament(key)).getTeams();
}

export function getTournaments(): Key[] {
    return existing_tournaments;
}

export async function checkSync(key: Key, sync: Sync) {
    if ((await getTournament(key)).sync !== sync) {
        throw new OutOfSyncError();
    }
}

async function useSync(key: Key, sync: Sync): Promise<[Key, Key]> {
    const t: Tournament = await getTournament(key);
    return [t.sync, (t.sync = newSync())];
}

export async function addTeamToTournament(key: Key, sync: Sync, name: string) {
    const t: Tournament = await getTournament(key);
    await checkSync(key, sync);
    if (!name) {
        throw new Error("invalid name!");
    } else if (t.isStarted()) {
        throw new Error("currently no team can be added!");
    }

    t.addTeam(name);
    const [osk, sk] = await useSync(key, sync);

    logger.log(`added team: ${name} to ${key}`);
    database.storeTournament(key, t);
    socket.sendTeams(key, sk, osk);
}

export async function editTeamInTournament(
    key: Key,
    sync: Sync,
    teamId: TeamId,
    name: string
) {
    await checkSync(key, sync);
    const t: Tournament = await getTournament(key);

    t.editTeam(teamId, name);
    const [osk, sk] = await useSync(key, sync);

    logger.log(`${key}: change team name from ${teamId} to ${name}`);
    database.storeTournament(key, t);
    socket.sendTeams(key, sk, osk);
}

export async function removeTeamFromTournament(
    key: Key,
    sync: Sync,
    id: TeamId
) {
    await checkSync(key, sync);
    const t: Tournament = await getTournament(key);

    if (id === undefined) {
        throw new Error("invalid id!");
    } else if (t.isStarted()) {
        throw new Error("currently no team can be removed!");
    }

    t.removeTeam(id);
    const [osk, sk] = await useSync(key, sync);

    logger.log(`removed team: ${id} from ${key}`);
    database.storeTournament(key, t);
    socket.sendTeams(key, sk, osk);
}

export async function setModeOfTournament(key: Key, sync: Sync, mode: number) {
    checkSync(key, sync);
    const t: Tournament = await getTournament(key);
    t.setMode(getMode(mode));
    const [osk, sk] = await useSync(key, sync);

    logger.log(`set mode of ${key} to ${mode}`);
    database.storeTournament(key, t);
    socket.sendStatus(key, sk, osk);
}

export async function startTournament(key: Key, sync: Sync) {
    checkSync(key, sync);
    const t: Tournament = await getTournament(key);
    t.invoke();
    const [osk, sk] = await useSync(key, sync);

    logger.success(`${key} started!`);
    database.storeTournament(key, t);
    socket.sendStatus(key, sk, osk);
    socket.sendStructure(key, sk, sk);
}

export async function resetTournament(key: Key, sync: Sync) {
    await checkSync(key, sync);
    const t: Tournament = await getTournament(key);
    t.reset();
    const [osk, sk] = await useSync(key, sync);

    logger.success(`${key} stopped!`);
    database.storeTournament(key, t);
    socket.sendStatus(key, sk, osk);
    socket.sendStructure(key, sk, sk);
}

export async function setResult(
    key: Key,
    sync: Sync,
    game_id: number,
    resultA: number,
    resultB: number
) {
    await checkSync(key, sync);
    const t: Tournament = await getTournament(key);
    const ow = t.winner;
    t.setResult(game_id, resultA, resultB);
    const [osk, sk] = await useSync(key, sync);

    const game: Game = t.search(game_id) as Game;
    logger.log(
        `new result for ${key}: + ${game.upstream_teams[0]}("${
            t.getTeam(game.upstream_teams[0])?.name ?? ""
        }") ${resultA}-${resultB} ${game.upstream_teams[1]}("${
            t.getTeam(game.upstream_teams[1])?.name ?? ""
        }")`
    );
    socket.sendStructure(key, sk, osk);

    if (t.winner !== ow) {
        if (t.winner !== undefined)
            logger.success(`${key}: ${t.getTeam(t.winner!)!.name} wins!`);
        socket.sendStatus(key, sk, sk);
    }
    database.storeTournament(key, t);
}

export async function unloadInactiveTournament(key: Key) {
    if (!socket.hasSubscription(key) && tournaments.has(key)) {
        logger.log(`${key}: Unload tournament data`);
        database.storeTournament(key, await getTournament(key));
        tournaments.delete(key);
    }
}
