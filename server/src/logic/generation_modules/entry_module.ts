import { Module} from "./module"
import { Team, TeamId } from "../../types/general_types";
import { ModuleId, State, Structure } from "../../types/module_types";
import { TournamentFacade } from "../tournament_facade";

export default class Entry extends Module {
    
    entryModule: ModuleId;

    constructor(tournament: TournamentFacade, teams: TeamId[], entryModule: any) {
        super(tournament, null, teams, true, "entry");
        this.entryModule = tournament.registerNewModule(new entryModule.default(tournament, this.id, this.downstream_teams, true));
        this.type = "entry"
    }

    structure() : Structure {
        return {
            id: this.id,
            type: this.type,
            label: this.label,
            visible: this.visible,
            state: this.state,
            modules: [this.entryModule],
            games: [],
            down: [],
            up: [],
            data: undefined
        }
    }

    moduleBuilder() : {last: boolean, modules: Module[] | null} {
        return {modules: [this.tournament.getModule(this.entryModule)], last: true}
    }

    onFinish() {
        this.upstream_teams = this.tournament.getModule(this.entryModule).upstream_teams
    }

    validInput() {
        return this.tournament.getModule(this.entryModule).validInput();
    }

    refreshGameState() {
        if(this.tournament.getModule(this.entryModule).state !== State.FINISHED) {
           this.upstream_teams = []; 
        }
        super.refreshGameState();
    }
}
