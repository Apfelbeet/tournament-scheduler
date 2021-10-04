import { Module } from "./module";
import Game from "./game_module";
import { Team } from "../../types/general_types";

/**
 * KOSystemGame is an inner representation of a single game
 */
export default class SimpleKOSystemGame extends Module {
    
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