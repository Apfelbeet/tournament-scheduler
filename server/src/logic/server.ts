import { Key, Team, Mode, Sync, TeamId } from "../types/general_types";
import { Status } from "../types/tournament_types";
import { randomKey } from "./util/util";
import * as config from "./server_config";
import { Tournament, newSync } from "./tournament";
import { Structure } from "../types/module_types";
import { OutOfSyncError } from "./util/errors";
import * as socket from "../network/socket_connection";

const tournaments = new Map<string, Tournament>();
let modes: Mode[] = [];

export function init() {
    modes = config.getModes();
}

export function newTournamentWithKey(key: Key): Key {
    if (tournamentExists(key)) {
        throw new Error(key + " is already in use!");
    }

    tournaments.set(key, new Tournament());
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
    return tournaments.has(key);
}

export function getTournament(key: Key): Tournament {
    if (!tournamentExists(key)) {
        throw new Error("tournament with key" + key + " does not exist!");
    }
    return tournaments.get(key)!;
}

export function getMode(id: number): Mode {
    let mode = modes.find((element) => element.id.toString() === id.toString());

    if (mode) {
        return mode;
    } else {
        throw new Error("no mode with id " + id + " was found!");
    }
}

export function getModes(): Mode[] {
    return modes;
}

export function getModeFromTournament(key: Key): Mode | undefined {
    return getTournament(key).mode;
}

export function getStatusFromTournament(key: Key): Status {
    return {
        started: getTournament(key).isStarted(),
        mode: getTournament(key).mode ? getTournament(key).mode!.id : -1,
    };
}

export function getStructureFromTournament(key: Key): Structure {
    return getTournament(key).getStructure();
}

export function getTeamsFromTournament(key: Key): Team[] {
    return getTournament(key).getTeams();
}

export function getTournaments(): Key[] {
    //TODO: There has to be a normal way to do this.
    let x: Key[] = [];
    tournaments.forEach((_, key) => {
        x.push(key);
    });
    return x;
}

export function useSync(key: Key, sync: Sync): [Key, Key] {
    if (getTournament(key).sync !== sync) {
        throw new OutOfSyncError();
    }
    return [getTournament(key).sync, (getTournament(key).sync = newSync())];
}

export function addTeamToTournament(key: Key, sync: Sync, name: string) {
    const [osk ,sk] = useSync(key, sync);
    if (!name) {
        throw new Error("invalid name!");
    }else if (getTournament(key).isStarted()) {
        throw new Error("currently no team can be added!");
    }
    
    

    getTournament(key).addTeam(name);

    socket.sendTeams(key, sk, osk);
}

export function removeTeamFromTournament(key: Key, sync: Sync , id: TeamId) {
    const [osk ,sk] = useSync(key, sync);
    if (id === undefined) {
        throw new Error("invalid id!");
    }else if (getTournament(key).isStarted()) {
        throw new Error("currently no team can be removed!");
    }

    getTournament(key).removeTeam(id);

    socket.sendTeams(key, sk, osk);
}

export function setModeOfTournament(key: Key, sync: Sync, mode: number) {
    const [osk ,sk] = useSync(key, sync);
    getTournament(key).setMode(getMode(mode));

    socket.sendStatus(key, sk, osk);
}

export function startTournament(key: Key, sync: Sync) {
    const [osk ,sk] = useSync(key, sync);
    getTournament(key).invoke();

    socket.sendStatus(key, sk, osk);
    socket.sendStructure(key, sk, sk);
}

export function resetTournament(key: Key, sync: Sync) {
    const [osk ,sk] = useSync(key, sync);
    getTournament(key).reset();

    socket.sendStatus(key, sk, osk);
    socket.sendStructure(key, sk, sk);
}

export function setResult(key: Key, sync: Sync, game_id: number, resultA: number, resultB: number) {
    const [osk ,sk] = useSync(key, sync);
    getTournament(key).setResult(game_id, resultA, resultB);

    socket.sendStructure(key, sk, osk);
}
