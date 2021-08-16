import {Team} from "./general_types"

export enum State {
    PREINIT = 0,
    INIT = 1,
    STARTED = 2,
    FINISHED = 3
}

export type Structure = {
    id: number, 
    type: string, 
    label: string, 
    visible: boolean, 
    state: State, 
    stats?: Stats[],
    data: any,
    modules: Structure[],
    games: Structure[],
    down: Team[],
    up: Team[],
}

export type Stats = {
    team: Team,
    wins: number,
    loses: number,
    scored: number,
    conceded: number,
}

export type CachedStats = {
    game: number,
    stats: Stats[]
}