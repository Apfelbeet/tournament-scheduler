import { Module} from "./module"
import { Team } from "../../types/general_types";
import { State, Structure } from "../../types/module_types";
import { Tournament } from "../tournament";
import { TournamentFacade } from "../tournament_facade";

export default class Entry extends Module {
    
    entryModule: Module;

    constructor(tournament: TournamentFacade, teams: Team[], entryModule: any) {
        super(tournament ,null, teams, true, "entry");
        this.entryModule = new entryModule.default(tournament, this.self(), this.downstream_teams, true);
        this.type = "entry"
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

    refreshGameState() {
        if(this.entryModule.state !== State.FINISHED) {
           this.upstream_teams = []; 
        }
        super.refreshGameState();
    }

    //FIXME: ???
    self(): Module {
        return this;
    }
}
