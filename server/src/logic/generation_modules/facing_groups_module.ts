import { Team } from "../../types/general_types";
import {
    addStats,
    compareStats,
    sortStats,
    subtractStats,
} from "../../util/util";
import Game from "./game_module";
import SimpleGroupModule from "./group_module";
import { Module } from "./module";
import { State } from "../../types/module_types";

export default class ExtendedGroupModule extends Module {
    constructor(master: Module, downstream_teams: Team[]) {
        super(master, downstream_teams, true, "Clash Phase");
    }

    gameBuilder(): { last: boolean; games: Module[] | null } {
        const teams1 = this.modules[0].upstream_teams;
        const teams2 = this.modules[1].upstream_teams;

        const games = [];
        for (let i = Math.min(teams1.length, teams2.length) - 1; i >= 0; i--) {
            games.push(new Game(this, [teams1[i], teams2[i]]));
        }

        return {
            last: true,
            games: games,
        };
    }

    moduleBuilder(): { last: boolean; modules: Module[] | null } {
        return {
            last: true,
            modules: [
                new SimpleGroupModule(
                    this,
                    this.downstream_teams.slice(
                        0,
                        this.downstream_teams.length / 2
                    ),
                    true,
                    "Group A"
                ),
                new SimpleGroupModule(
                    this,
                    this.downstream_teams.slice(
                        this.downstream_teams.length / 2
                    ),
                    true,
                    "Group B"
                ),
            ],
        };
    }

    invokeStats() {
        this.stats_cache = {
            games: [],
        };

        this.stats = [];
        for (
            let i = 0;
            i < this.modules[0].stats.length ||
            i < this.modules[1].stats.length;
            i++
        ) {
            const t = [];
            if (i < this.modules[0].stats.length) {
                t.push(this.modules[0].stats[i]);
                this.stats_cache.games.push({
                    game: this.modules[0].id,
                    stats: this.modules[0].stats,
                });
            }
            if (i < this.modules[1].stats.length) {
                t.push(this.modules[1].stats[i]);
                this.stats_cache.games.push({
                    game: this.modules[1].id,
                    stats: this.modules[1].stats,
                });
            }
            sortStats(t);
            this.stats = [...this.stats, ...t];
        }
    }

    composeStats() {
        if (this.modules.some((game) => game.changed)) {
            this.invokeStats();
        }

        super.composeStats(false);
        for (let i = this.games.length - 1; i >= 0; i--) {
            if (this.games[i].state == State.FINISHED) {
                const leadingStats = this.stats[this.stats.length - 2 * i - 2];
                const losingStats = this.stats[this.stats.length - 2 * i - 1];
                const winnerTeamFromGame = this.games[i].upstream_teams[0].id;
                if (
                    leadingStats.team.id !== winnerTeamFromGame ||
                    compareStats(leadingStats, losingStats) > 0
                ) {
                    this.stats[this.stats.length - 2 * i - 2] = losingStats;
                    this.stats[this.stats.length - 2 * i - 1] = leadingStats;
                }
            }
        }
    }

    onFinish() {
        if (this.games.length > 0) {
            this.upstream_teams =
                this.games[this.games.length - 1].upstream_teams;
        }
    }

    validInput() {
        return this.downstream_teams.length >= 4;
    }
}
