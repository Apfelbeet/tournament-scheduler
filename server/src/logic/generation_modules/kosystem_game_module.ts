import { Module } from "./module";
import Game from "./game_module";
import { Team, TeamId } from "../../types/general_types";
import { TournamentFacade } from "../tournament_facade";
import { ModuleId } from "../../types/module_types";

/**
 * KOSystemGame is an inner representation of a single game
 */
export default class SimpleKOSystemGame extends Module {

    constructor(tournament: TournamentFacade, master: ModuleId, downstream_teams: TeamId[], level = 0) {
        super(tournament, master, downstream_teams, false, getLabelFromLevel(level));
        this.additional_attributes.level = level;
        this.type = "ko-system-game";
        this.visible = true;
    }

    gameBuilder() : {last: boolean, games: Module[] | null} {
        if (this.modules.length === 0) {
            return {
                games: [new Game(this.tournament, this.id, this.downstream_teams)],
                last: true
            }
        } else {
            const modules = this.tournament.getModules(this.modules);

            return {
                games: [new Game(
                    this.tournament,
                    this.id,
                    [modules[0].upstream_teams[0], modules[1].upstream_teams[0]],
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
                new SimpleKOSystemGame(this.tournament, this.id, a, this.additional_attributes.level + 1),
                new SimpleKOSystemGame(this.tournament, this.id, b, this.additional_attributes.level + 1)
            ],
            last: true,
        }
    }

    onFinish() {
        //Game sorts the player: Winner at index 0 and Loser at index 1
        //The parent module has to know what to do with this information
        this.upstream_teams = this.tournament.getModule(this.games[0]).upstream_teams;
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