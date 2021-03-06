import { randomKey } from "../util/util";
import Entry from "./generation_modules/entry_module";
import { Module } from "./generation_modules/module";
import Game from "./generation_modules/game_module";
import { Mode, Team, TeamId , Sync} from "../types/general_types";
import { TournamentFacade } from "./tournament_facade";
import { ModuleId, Structure } from "../types/module_types";


export function newSync(): Sync {
    return randomKey(20);
}

export class Tournament {
    sync: Sync = newSync();

    entry?: Entry;

    mode?: Mode;

    teams = new Map<TeamId, Team>();
    new_team_id: TeamId = 0;
    winner?: TeamId;

    modules: Map<ModuleId, Module> = new Map();
    new_module_id: ModuleId = 0;

    invoke() {
        if (!this.mode) {
            throw new Error("No mode selected!");
        }
        if (this.isStarted()) {
            throw new Error("Tournament has already started!");
        }

        this.entry = new Entry(
            new TournamentFacade(this),
            null,
            Array.from(this.teams.keys()),
        );
        this.entry.setEntryModule(this.mode.init);
        
        if (this.entry.validInput()) {
            this.entry.invoke();
        } else {
            this.entry = undefined;
            throw new Error(
                "Selected mode has issues with the current configuration!"
            );
        }
    }

    reset() {
        this.entry = undefined;
        this.winner = undefined;
        this.modules = new Map();
    }

    addTeam(name: string) {
        if (this.isStarted())
            throw new Error(
                "Can't add any teams while the tournament is running!"
            );

        const id = this.nextTeamId();
        this.teams.set(id, { name: name, id: id });
    }

    editTeam(id: TeamId, name: string) {
        if (this.isStarted()) {
            throw new Error(
                "Can't edit teams while the tournament is running!"
            );
        }
        if (!this.teams.has(id)) {
            throw new Error(
                "Invalid id!"
            );
        }
        if (!name) {
            throw new Error("invalid name!");
        }
        this.teams.set(id, { id: id, name: name });
    }

    removeTeam(id: TeamId) {
        if (this.isStarted())
            throw new Error(
                "Can't remove any teams while the tournament is running!"
            );

        this.teams.delete(id);
    }

    getTeam(id: TeamId): Team | undefined {
        return this.teams.get(id);
    }

    getTeams(): Team[] {
        return Array.from(this.teams.values());
    }

    nextTeamId() {
        return this.new_team_id++;
    }

    registerNewModule(module: Module) {
        this.modules.set(module.id, module);
    }

    getModuleStructures(): Structure[] {
        if (!this.isStarted()) throw new Error("No active tournament!");
        return [this.entry!.structure(), ...Array.from(this.modules.values()).map(m => m.structure())];
    }

    setMode(mode: Mode) {
        this.mode = mode;
    }

    setWinner(id: TeamId) {
        this.winner = id;
    }

    isStarted() {
        return this.entry !== undefined;
    }

    getEntry(): Entry | undefined {
        return this.entry;
    }

    search(id: ModuleId): Module | undefined {
        if (this.isStarted()) {
            return this.modules.get(id);
        } else {
            throw new Error("tournament isn't active!");
        }
    };

    setResult(game_id: number, resultA: number, resultB: number) {
        if (typeof game_id == "number" && typeof resultA == "number" && typeof resultB == "number") {
            const game = this.search(game_id);

            if (game === undefined || game.type !== "game") {
                throw new Error("invalid game id: " + game_id);
            }

            (game as Game).setResult(resultA, resultB);

            //If the entry module has any teams in the upstream, we assume the game is over.
            //It is sufficient to only check is after a result is set, because thats the only event
            //that can cause a game to end.
            if(this.entry!.upstream_teams.length > 0) {
                this.winner = this.entry!.upstream_teams[0];
            } else {
                this.winner = undefined;
            }
        } else {
            throw new Error(
                "incomplete data: {id: " +
                game_id +
                ", resultA: " +
                resultA +
                ", resultB: " +
                resultB +
                "}"
            );
        }
    }
}


