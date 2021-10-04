import { Module } from "../logic/generation_modules/module";
import { State, Stats } from "../types/module_types";

export function randomKey(length: number) {
    let x = "";
    for (let i = length; i > 0; i -= 11) {
        x += Math.random()
            .toString(36)
            .substring(2, length + 2);
    }
    return x;
}

export function getRandomInt(max: number) {
    return Math.floor(Math.random() * Math.floor(max + 1));
}

export function addStats(a: Stats, b: Stats): Stats {
    return {
        team: a.team,
        wins: a.wins + b.wins,
        loses: a.loses + b.loses,
        scored: a.scored + b.scored,
        conceded: a.conceded + b.conceded,
    };
}

export function subtractStats(a: Stats, b: Stats): Stats {
    return {
        team: a.team,
        wins: a.wins - b.wins,
        loses: a.loses - b.loses,
        scored: a.scored - b.scored,
        conceded: a.conceded - b.conceded,
    };
}

export function sortStats(stats: Stats[], games?: Module[]) {
    stats.sort((a, b) => compareStats(a, b, games));
}

export function compareStats(a: Stats, b: Stats, games?: Module[]): number {
    const winDiff = b.wins - b.loses - (a.wins - a.loses);
    if (winDiff === 0) {
        const scoreDiff = b.scored - b.conceded - (a.scored - b.scored);
        if (games !== undefined && scoreDiff === 0) {
            let a_wins = 0;
            let b_wins = 0;
            games.filter(g => g.type === "game" && g.state === State.FINISHED).forEach(g => {
                if (g.upstream_teams[0] === a.team && g.upstream_teams[1] === b.team) {
                    a_wins++;
                } else if (g.upstream_teams[1] === b.team && g.upstream_teams[0] === a.team) {
                    b_wins++;
                }
            });
            return b_wins - a_wins;
        }
        return scoreDiff;
    }
    return winDiff;
}
