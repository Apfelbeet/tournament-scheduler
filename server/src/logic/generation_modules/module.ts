import { Team } from "../../types/general_types"
import { State, Structure, Stats } from "../../types/module_types"
import * as logger from "../../util/logger";

let id = 0;

export class Module {


    /**
    * The master node will be notified in the onFinish-Event.
    */
    master: Module | null;

    /**
    * Downstream teams are first divided into the submodules.
    * The resulting upstream is then used to build "game" modules.
    */
    downstream_teams: Team[];

    upstream_teams: Team[];

    /**
    * Every Module as a state, that indicates how much of it is already resolved.
    * 0: Only blueprint functions and preferences
    * 1: Submodules are generated
    * 2: Games are generated
    */
    state: State;

    id: number;

    label: string;

    visible: boolean;

    modules: Module[];

    games: Module[];

    stats?: Stats[];

    data?: any;

    changed: boolean;

    /**
     * The type shows the type of the module.
     * This can help to filter for certain modules and can be used by the UI to make different representations of the modules.
     * Therefore, if you want to give the module special treatment, you should rename this attribute uniquely.
     */
    type: string = "module";

    constructor(master: Module | null, downstream_teams: any[], visible: boolean = true, label: string = "unnamed") {
        this.master = master;
        this.downstream_teams = downstream_teams;
        this.state = State.PREINIT;
        this.id = id++;
        this.label = label;
        this.visible = visible;
        this.modules = [];
        this.games = [];
        this.upstream_teams = [];
        this.changed = false;
    }


    /**
     * Called to finish up the current module:
     *  - determine upstream_teams: List of teams that can play in next module.
     *      (the order of the array presents the rank of the teams in this module)
     */
    onFinish() {
    }

    updateModules() {
        if(this.state === State.FINISHED) {
            this.upstream_teams = [];
        }
        this.games = [];
        this.state = State.INIT;
        this.changed = true;
    }

    updateGames() {
        this.state = State.STARTED;
        this.changed = true;
    }

    /**
     * Generate submodules. Submodule will be generated before the actual games of this module
     */
    moduleBuilder(): { last: boolean, modules: Module[] | null } {
        return { modules: null, last: true };
    }

    /**
     * Generate inner modules/games. Games will be generated, if all submodules are finished.
     */
    gameBuilder(): { last: boolean, games: Module[] | null } {
        return { games: null, last: true };
    }

    /**
     * Generating submodules and invoking them.
     */
    resolveSubModules() {
        while (true) {
            const result = this.moduleBuilder();
            if (result.modules != null) {
                this.modules = [...this.modules, ...result.modules]
            }
            if (result.last !== false) break;
        }
        this.modules.forEach(e => e.invoke());
    }

    /**
     * Generating games and invoking them.
     */
    resolveGames() {
        while (true) {
            const result = this.gameBuilder();
            if (result.games != null) {
                this.games = [...this.games, ...result.games];
            }
            if (result.last !== false) break;
        }
        this.games.forEach(e => e.invoke());
    }

    /**
     * Finishing up the current module
     */
    finish() {
        this.onFinish();
        this.master?.refreshGameState();
    }


    /**
     * Invoking the module: Set Game-State and generate Submodules
     */
    invoke() {
        this.state = State.INIT;
        this.resolveSubModules();
        this.refreshGameState();
    }

    refreshGameState() {
        //
        //Track changes in submodules and games
        //
        const clear = (list: Module[]) => list.forEach(m => m.changed = false);

        switch (this.state) {
            case State.INIT:
                clear(this.modules);
                break;

            case State.STARTED:
                if (this.modules.some(value => value.changed)) {
                    this.updateModules();
                    clear(this.modules);
                }

                clear(this.games);
                break;

            case State.FINISHED:
                if (this.modules.some(value => value.changed)) {
                    this.updateModules();
                    clear(this.modules);
                }

                if (this.games.some(value => value.changed)) {
                    this.updateGames();
                    clear(this.games);
                }

                break;
        }

        if (this.changed && this.state == State.FINISHED) {
            this.finish();
        } else if(this.changed) {
            this.master?.refreshGameState();
        }

        //
        //Generating Modules based on state:
        //

        if(this.state === State.INIT) {
            if (this.modules.every(value => value.state === State.FINISHED)) {
                this.state = State.STARTED;
                this.resolveGames();
            }
        }

        if(this.state == State.STARTED) {
            if (this.games.every(value => value.state === State.FINISHED)) {
                this.state = State.FINISHED;
                this.finish();
            }
        }
    }

    /**
     * Recursive Method to generate a json-object as representation of the whole tournament.
     * This Method can be used to build an graphical interface.
     */
    structure(): Structure {
        return {
            id: this.id,
            type: this.type,
            label: this.label,
            visible: this.visible,
            state: this.state,
            modules: this.modules.map(e => e.structure()),
            games: this.games.map(e => e.structure()),
            down: this.downstream_teams,
            up: this.upstream_teams,
            stats: this.stats,
            data: this.data,
        };
    }

    /**
     * Search for module with given id
     * @param id
     * @return {undefined|Module}
     */

    search(id: number): Module | undefined {
        if (id === this.id) {
            return this;
        } else {
            for (let i = 0; i < this.modules.length; i++) {
                const ret = this.modules[i].search(id);
                if (ret) return ret;
            }
            for (let i = 0; i < this.games.length; i++) {
                const ret = this.games[i].search(id);
                if (ret) return ret;
            }
        }
    }

    /**
     * Can be used to check, if this module works with the given input.
     */
    validInput(): boolean {
        return true;
    }

}