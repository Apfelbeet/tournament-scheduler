import { Module } from "./module";
import Group from "./group_module";
import { Team } from "../../types/general_types";
import SimpleKOSystemGame from "./kosystem_game_module";

/**
 * In KO-System the losing team discards after the game
 */
export default class SimpleKOSystem extends Module {
    
    constructor(master: Module, downstream_teams: Team[]) {
        super(master, downstream_teams, true, "K.O. Phase");
        this.type = "ko-system";
    }

    gameBuilder() : {last: boolean, games: Module[] | null} {
        const teams =
            this.modules.map(module => module.upstream_teams.slice(0, 2)).reduce((a, b) => [...a, ...b]);

        const reordered = [];
        for (let i = 0; i < Math.floor(teams.length / 2); i++) {
            reordered.push(teams[i]);
            reordered.push(teams[teams.length - i - 1]);
        }

        return {
            games: [
                new SimpleKOSystemGame(
                    this,
                    reordered,
                )
            ],
            last: true
        }
    }

    moduleBuilder() : {last: boolean, modules: Module[] | null} {
        if (this.downstream_teams.length >= 4) {
            return {
                modules: [
                    new Group(this, this.downstream_teams.slice(0, this.downstream_teams.length / 2), true, "Group A"),
                    new Group(this, this.downstream_teams.slice(this.downstream_teams.length / 2), true, "Group B")
                ],
                last: true
            };
        } else if (this.downstream_teams.length > 1) {
            return {
                modules: [
                    new Group(this, this.downstream_teams.slice(0, this.downstream_teams.length)),
                ],
                last: true
            }
        } else {
            return {modules: null, last: true}
        }
    }

    onFinish() {
        this.upstream_teams = this.games[0].upstream_teams;
    }

    validInput() {
        return this.downstream_teams.length >= 2;
    }
}
