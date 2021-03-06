import { Module } from "./module";
import { TeamId } from "../../types/general_types";
import { TournamentFacade } from "../tournament_facade";
import { ModuleId } from "../../types/module_types";
import DrawGame from "./draw_game_module";

/**
 * Group is the classic model of a group in which everybody plays against everybody
 */
export default class SimpleGroupModule extends Module {
    constructor(
        tournament: TournamentFacade,
        master: ModuleId,
        teams: TeamId[],
        visible: boolean = true,
        label: string = "Group"
    ) {
        super(tournament, master, teams, "group" ,visible, label);
    }

    /**
     * Generate games, every team vs every team.
     * (currently the order of teams is boring/bad and should be changed)
     */
    gameBuilder(): Module[] {
        const games = [];
        for (let i = 0; i < this.downstream_teams.length; i++) {
            for (let j = 0; j < this.downstream_teams.length - 1 - i; j++) {
                if (j % 2 === 0) {
                    games.push(
                        new DrawGame(this.tournament, this.id, [
                            this.downstream_teams[i],
                            this.downstream_teams[j + i + 1],
                        ])
                    );
                } else {
                    games.push(
                        new DrawGame(this.tournament, this.id, [
                            this.downstream_teams[j + i + 1],
                            this.downstream_teams[i],
                        ])
                    );
                }
            }
        }

        const shuffled = [];

        for (let i = 0; i < Math.floor(games.length / 2); i++) {
            shuffled.push(games[i]);
            shuffled.push(games[games.length - 1 - i]);
        }
        if (games.length % 2 === 1) {
            shuffled.push(games[Math.floor(games.length / 2)]);
        }

        return shuffled;
    }

    /**
     * Collect stats of games and determine the order of the upstream teams
     */
    onFinish() {
        if (this.stats !== undefined) {
            //Sorting upstream: best team first -> worst team last
            this.upstream_teams = this.stats.map((stat) => stat.team);
        } else {
            throw new Error("group_module: stats is undefined.");
        }
    }

    validInput(): boolean {
        return this.downstream_teams.length >= 2;
    }
}
