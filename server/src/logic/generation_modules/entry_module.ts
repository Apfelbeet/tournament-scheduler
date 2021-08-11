import { Module} from "./module"
import { Team } from "../../types/general_types";
import { Structure } from "../../types/module_types";

export class Entry extends Module {
    
    entryModule: Module;

    constructor(teams: Team[], entryModule: typeof Module) {
        super(null, teams, true, "entry");
        this.entryModule = new entryModule(this.self(), this.downstream_teams, true);
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
        //TODO:
    }

    validInput() {
        return this.entryModule.validInput();
    }

    //FIXME: ???
    self(): Module {
        return this;
    }
}
