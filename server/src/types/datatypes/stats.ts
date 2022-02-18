import { Module } from "../../logic/generation_modules/module";
import * as logger from "../../util/logger"
import { TeamId } from "../general_types";
import { State } from "../module_types";

export type Stats = {
    team: TeamId;
    points: number;
    wins: number;
    loses: number;
    draws: number;
    scored: number;
    conceded: number;
};

export type StatsData = {
    points?: number;
    wins?: number;
    loses?: number;
    draws?: number;
    scored?: number;
    conceded?: number;
};

export function emptyStats(team: TeamId): Stats {
    return {
        team: team,
        points: 0,
        wins: 0,
        loses: 0,
        draws: 0,
        scored: 0,
        conceded: 0,
    };
}

export function statsWith(stats: Stats, data: StatsData): Stats {
    const newStats = emptyStats(stats.team);
    Object.assign(newStats, stats);
    Object.assign(newStats, data);
    return newStats;
}

export function addStats(a: Stats, b: Stats): Stats {
    return {
        team: a.team,
        points: a.points + b.points,
        wins: a.wins + b.wins,
        loses: a.loses + b.loses,
        draws: a.draws + b.draws,
        scored: a.scored + b.scored,
        conceded: a.conceded + b.conceded,
    };
}

export function subtractStats(a: Stats, b: Stats): Stats {
    return {
        team: a.team,
        points: a.points - b.points,
        wins: a.wins - b.wins,
        loses: a.loses - b.loses,
        draws: a.draws - b.draws,
        scored: a.scored - b.scored,
        conceded: a.conceded - b.conceded,
    };
}

export function sortStats(stats: Stats[], games?: Module[]) {
    if (games === undefined) stats.sort((a, b) => flatCompareStats(a, b));
    else stats.sort((a, b) => deepCompareStats(a, b, games));
}

/**
 * Does a basic comparison between two stats. First comparing points, and then
 * scored points. There might be cases where both stats are seen as equal, you
 * can get a more detailed comparison, by using deepCompareStats()
 */
export function flatCompareStats(a: Stats, b: Stats): number {
    const pointDiff = b.points - a.points;
    if (pointDiff !== 0) {
        return pointDiff;
    }

    const scoreDiff = b.scored - b.conceded - (a.scored - a.conceded);
    return scoreDiff;
}

/**
 * First performing a simple (flat) comparison and if they seem to be equal, it
 * evaluates the direct games between both teams.
 *
 * The result can still be equal.
 *
 * In most cases the flat comparison already is enough. But a lot direct
 * comparisons, will have an effect on the performance.
 */
export function deepCompareStats(a: Stats, b: Stats, games: Module[]): number {
    const flat = flatCompareStats(a, b);
    if (flat !== 0) return flat;

    //Perform direct comparison of both teams/stats
    //Filtering for games between both and compare their stats

    type Res = {
        aStats: Stats;
        bStats: Stats;
    };

    const moduleIsFinishedGame = (g: Module) =>
        g.type === "game" && g.state === State.FINISHED;
    const gameHasCurrentTeams = (g: Module) =>
        (g.upstream_teams[0] === a.team && g.upstream_teams[1] === b.team) ||
        (g.upstream_teams[0] === b.team && g.upstream_teams[1] === a.team);

    const reduceStats = (akk: Res, g: Module) => {
        const indexA = g.stats[0].team === a.team ? 0 : 1;
        const indexB = g.stats[0].team === a.team ? 1 : 0;

        return {
            aStats: addStats(akk.aStats, g.stats[indexA]),
            bStats: addStats(akk.bStats, g.stats[indexB]),
        };
    };

    const res: Res = games
        .filter(moduleIsFinishedGame)
        .filter(gameHasCurrentTeams)
        .reduce<Res>(reduceStats, {
            aStats: emptyStats(a.team),
            bStats: emptyStats(b.team),
        });

    return flatCompareStats(res.aStats, res.bStats);
}


