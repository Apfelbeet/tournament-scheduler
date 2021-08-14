import { randomKey } from "../util/util";
import { Entry } from "./generation_modules/entry_module";
import { Module } from "./generation_modules/module";
import { Game } from "./generation_modules/game_module";
import { Mode, Team, TeamId , Sync} from "../types/general_types";

export function newSync(): Sync {
    return randomKey(20);
}

export class Tournament {
    sync: Sync = newSync();

    entry?: Entry;

    mode?: Mode;

    teams = new Map<TeamId, Team>();
    new_team_id: TeamId = 0;

    invoke() {
        if (!this.mode) {
            throw new Error("No mode selected!");
        }
        if (this.isStarted()) {
            throw new Error("Tournament has already started!");
        }

        this.entry = new Entry(
            Array.from(this.teams.values()),
            this.mode.init
        );
        if (this.entry.validInput()) {
            this.entry.invoke();
        } else
            throw new Error(
                "Selected mode has issues with the current configuration!"
            );
    }

    reset() {
        this.entry = undefined;
    }

    addTeam(name: string) {
        if (this.isStarted())
            throw new Error(
                "Can#t add any teams while the tournament is running!"
            );

        const id = this.nextId();
        this.teams.set(id, { name: name, id: id });
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

    nextId() {
        return this.new_team_id++;
    }

    getStructure() {
        if (!this.isStarted()) throw new Error("No active tournament!");
        return this.entry!.structure();
    }

    setMode(mode: Mode) {
        this.mode = mode;
    }

    isStarted() {
        return this.entry !== undefined;
    }

    getEntry(): Entry | undefined {
        return this.entry;
    }

    search(id: number): Module | undefined {
        if (this.isStarted()) {
            return this.entry!.search(id);
        } else {
            throw new Error("tournament isn't active!");
        }
    };

    setResult(game_id: number, resultA: number, resultB: number) {
        if (game_id && resultA && resultB) {
            const game = this.search(game_id);

            if (game === undefined || game.type !== "game") {
                throw new Error("invalid game id: " + game_id);
            }

            (game as Game).setResult(resultA, resultB);
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


