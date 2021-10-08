import {TeamId} from "./general_types"

export enum State {
    PREINIT = 0,
    INIT = 1,
    STARTED = 2,
    FINISHED = 3
}

export type ModuleId = number;

export type Structure = {
    id: number, 
    type: string, 
    label: string, 
    visible: boolean, 
    state: State, 
    stats?: Stats[],
    data: any,
    modules: ModuleId[],
    games: ModuleId[],
    down: TeamId[],
    up: TeamId[],
}

export type Stats = {
    team: TeamId,
    wins: number,
    loses: number,
    scored: number,
    conceded: number,
}

export type CachedStats = {
    game: ModuleId,
    stats: Stats[]
}