
import { ModuleId } from "../types/module_types";
import { Module } from "./generation_modules/module";
import { Tournament } from "./tournament";

export class TournamentFacade {
    
    tournament: Tournament;

    constructor(tournament: Tournament) {
        this.tournament = tournament;
    }

    registerNewModule(module: Module): ModuleId {
        this.tournament.registerNewModule(module);
        return module.id;
    }

    getModule(id: ModuleId): Module {
        if (this.tournament.getEntry()?.id === id) {
            return this.tournament.getEntry()!;
        }
        if (this.tournament.modules.has(id)) {
            return this.tournament.modules.get(id)!;
        }
        throw Error("Unknown Module with id: " + id);
    }

    getModules(ids: ModuleId[]): Module[] {
        return ids.map(id => this.getModule(id));
    }

    newModuleId() {
        return this.tournament.new_module_id++;
    }
}