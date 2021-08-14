import { Module} from "./module"
import { Team } from "../../types/general_types";
import { Structure } from "../../types/module_types";
import * as logger from "../../util/logger";
import { Tournament } from "../tournament";

export class Entry extends Module {
    
    entryModule: Module;
    tournament: Tournament;

    constructor(teams: Team[], entryModule: any, tournament: Tournament) {
        super(null, teams, true, "entry");
        this.entryModule = new entryModule.default(this.self(), this.downstream_teams, true);
        this.type = "entry"
        this.tournament = tournament;
    }

    structure() : Structure {
        return {
            id: this.id,
            type: this.type,
            label: this.label,
            visible: this.visible,
            state: this.state,
            modules: [this.entryModule.structure()],
            games: [],
            down: [],
            up: [],
            data: undefined
        }
    }

    moduleBuilder() : {last: boolean, modules: Module[] | null} {
        return {modules: [this.entryModule], last: true}
    }

    onFinish() {
        this.upstream_teams = this.entryModule.upstream_teams
    }

    validInput() {
        return this.entryModule.validInput();
    }

    //FIXME: ???
    self(): Module {
        return this;
    }
}
