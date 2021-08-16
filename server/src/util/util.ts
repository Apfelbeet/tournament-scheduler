import { Stats } from "../types/module_types";

export function randomKey(length: number) {
    let x = '';
    for(let i = length; i > 0; i -= 11) {
        x +=  Math.random().toString(36).substring(2, length + 2);
    }
    return x;
}

export function getRandomInt(max: number) {
    return Math.floor(Math.random() * Math.floor(max+1));
}

export function addStats(a: Stats, b: Stats): Stats {
    return {
        team: a.team,
        wins: a.wins + b.wins,
        loses: a.loses + b.loses,
        scored: a.scored + b.scored,
        conceded: a.conceded + b.conceded
    }
}

export function subtractStats(a: Stats, b: Stats): Stats {
    return {
        team: a.team,
        wins: a.wins - b.wins,
        loses: a.loses - b.loses,
        scored: a.scored - b.scored,
        conceded: a.conceded - b.conceded
    }
}