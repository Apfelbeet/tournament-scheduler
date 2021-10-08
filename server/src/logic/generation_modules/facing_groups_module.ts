import { Team, TeamId } from "../../types/general_types";
import {
    addStats,
    compareStats,
    sortStats,
    subtractStats,
} from "../../util/util";
import Game from "./game_module";
import SimpleGroupModule from "./group_module";
import { Module } from "./module";
import { ModuleId, State } from "../../types/module_types";
import { TournamentFacade } from "../tournament_facade";

export default class ExtendedGroupModule extends Module {
    constructor(
        tournament: TournamentFacade,
        master: ModuleId,
        teams: TeamId[]
    ) {
        super(tournament, master, teams, "facing_groups", true, "Clash Phase");
    }

    gameBuilder(): { last: boolean; games: Module[] | null } {
        const teams1 = this.tournament.getModule(
            this.modules[0]
        ).upstream_teams;
        const teams2 = this.tournament.getModule(
            this.modules[1]
        ).upstream_teams;

        const games = [];
        for (let i = Math.min(teams1.length, teams2.length) - 1; i >= 0; i--) {
            games.push(
                new Game(this.tournament, this.id, [teams1[i], teams2[i]])
            );
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
                    this.tournament,
                    this.id,
                    this.downstream_teams.slice(
                        0,
                        this.downstream_teams.length / 2
                    ),
                    true,
                    "Group A"
                ),
                new SimpleGroupModule(
                    this.tournament,
                    this.id,
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

        const modules = this.tournament.getModules(this.modules);

        for (
            let i = 0;
            i < modules[0].stats.length || i < modules[1].stats.length;
            i++
        ) {
            const t = [];
            if (i < modules[0].stats.length) {
                t.push(modules[0].stats[i]);
                this.stats_cache.games.push({
                    game: modules[0].id,
                    stats: modules[0].stats,
                });
            }
            if (i < modules[1].stats.length) {
                t.push(modules[1].stats[i]);
                this.stats_cache.games.push({
                    game: modules[1].id,
                    stats: modules[1].stats,
                });
            }
            sortStats(t);
            this.stats = [...this.stats, ...t];
        }
    }

    composeStats() {
        if (
            this.tournament
                .getModules(this.modules)
                .some((game) => game.changed)
        ) {
            this.invokeStats();
        }

        super.composeStats(false);
        for (let i = this.games.length - 1; i >= 0; i--) {
            const game = this.tournament.getModule(this.games[i]);
            if (game.state == State.FINISHED) {
                const leadingStats = this.stats[this.stats.length - 2 * i - 2];
                const losingStats = this.stats[this.stats.length - 2 * i - 1];
                const winnerTeamFromGame = game.upstream_teams[0];
                if (
                    leadingStats.team !== winnerTeamFromGame ||
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
            this.upstream_teams = this.tournament.getModule(
                this.games[this.games.length - 1]
            ).upstream_teams;
        }
    }

    validInput() {
        return this.downstream_teams.length >= 4;
    }
}
