import { Module } from "./module";
import { Game } from "./game_module";
import Group from "./group_module";
import { Team } from "../../types/general_types";

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


/**
 * KOSystemGame is an inner representation of a single game
 */
class SimpleKOSystemGame extends Module {
    
    level: number;

    constructor(master: Module, downstream_teams: Team[], level = 0) {
        super(master, downstream_teams, false, getLabelFromLevel(level));
        this.level = level;
        this.type = "ko-system-game";
        this.visible = true;
    }

    gameBuilder() : {last: boolean, games: Module[] | null} {
        if (this.modules.length === 0) {
            return {
                games: [new Game(this, this.downstream_teams)],
                last: true
            }
        } else {
            return {
                games: [new Game(
                    this,
                    [this.modules[0].upstream_teams[0], this.modules[1].upstream_teams[0]],
                )],
                last: true
            }
        }
    }

    moduleBuilder() : {last: boolean, modules: Module[] | null} {
        if (this.downstream_teams.length <= 2) {
            return {modules: null, last: true};
        }

        const a = this.downstream_teams.slice(0, this.downstream_teams.length / 2);
        const b = this.downstream_teams.slice(this.downstream_teams.length / 2, this.downstream_teams.length);

        return {
            modules: [
                new SimpleKOSystemGame(this, a, this.level + 1),
                new SimpleKOSystemGame(this, b, this.level + 1)
            ],
            last: true,
        }
    }

    onFinish() {
        //Game sorts the player: Winner at index 0 and Loser at index 1
        //The parent module has to know what to do with this information
        this.upstream_teams = this.games[0].upstream_teams;
    }

    validInput() {
        return this.downstream_teams.length >= 2;
    }
}

const labels = ["Final", "Semifinal", "Quarterfinal"];

function getLabelFromLevel(level: number) : string {
    if(level > 2) return "KO-Game"
    return labels[level];
}
