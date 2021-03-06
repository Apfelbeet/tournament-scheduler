import { Module } from "./module";
import Group from "./group_module";
import { TeamId } from "../../types/general_types";
import SimpleKOSystemGame from "./kosystem_game_module";
import { TournamentFacade } from "../tournament_facade";
import { ModuleId } from "../../types/module_types";

/**
 * In KO-System the losing team discards after the game
 */
export default class SimpleKOSystem extends Module {
    constructor(
        tournament: TournamentFacade,
        master: ModuleId,
        teams: TeamId[]
    ) {
        super(tournament, master, teams, "kosystem", true, "K.O. Phase");
    }

    gameBuilder(): Module[] {
        const teams = this.modules
            .map((id) =>
                this.tournament.getModule(id).upstream_teams.slice(0, 2)
            )
            .reduce((a, b) => [...a, ...b]);

        const reordered = [];
        for (let i = 0; i < Math.floor(teams.length / 2); i++) {
            reordered.push(teams[i]);
            reordered.push(teams[teams.length - i - 1]);
        }

        return [
            new SimpleKOSystemGame(this.tournament, this.id, reordered),
        ];
    }

    moduleBuilder(): Module[] {
        if (this.downstream_teams.length >= 4) {
            return [
                new Group(
                    this.tournament,
                    this.id,
                    this.downstream_teams.slice(
                        0,
                        this.downstream_teams.length / 2
                    ),
                    true,
                    "Group A"
                ),
                new Group(
                    this.tournament,
                    this.id,
                    this.downstream_teams.slice(
                        this.downstream_teams.length / 2
                    ),
                    true,
                    "Group B"
                ),
            ];
        } else if (this.downstream_teams.length > 1) {
            return [
                new Group(
                    this.tournament,
                    this.id,
                    this.downstream_teams.slice(
                        0,
                        this.downstream_teams.length
                    )
                ),
            ];
        } else {
            return [];
        }
    }

    onFinish() {
        this.upstream_teams = this.tournament.getModule(
            this.games[0]
        ).upstream_teams;
    }

    validInput() {
        return this.downstream_teams.length >= 2;
    }
}
