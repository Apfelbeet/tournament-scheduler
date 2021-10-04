import { Team } from "../../types/general_types";
import { State, Structure, Stats, CachedStats, ModuleId } from "../../types/module_types";
import { addStats, sortStats, subtractStats } from "../../util/util";
import { TournamentFacade } from "../tournament_facade";
import Entry from "./entry_module";

let id = 0;

export class Module {
    
    tournament: TournamentFacade;
    
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

    id: ModuleId;

    label: string;

    visible: boolean;

    modules: Module[];

    games: Module[];

    stats: Stats[];
    stats_cache: {
        games: CachedStats[];
    };

    data?: any;

    changed: boolean;

    /**
     * The type shows the type of the module.
     * This can help to filter for certain modules and can be used by the UI to make different representations of the modules.
     * Therefore, if you want to give the module special treatment, you should rename this attribute uniquely.
     */
    type: string = "module";

    constructor(
        tournament: TournamentFacade,
        master: Module | null,
        downstream_teams: any[],
        visible: boolean = true,
        label: string = "unnamed"
    ) {
        this.tournament = tournament;
        this.master = master;
        this.downstream_teams = downstream_teams;
        this.state = State.PREINIT;
        this.id = id++;
        this.label = label;
        this.visible = visible;
        this.modules = [];
        this.games = [];
        this.upstream_teams = [];
        this.stats_cache = {
            games: [],
        };
        this.changed = false;
        this.stats = [];
    }

    /**
     * Called to finish up the current module:
     *  - determine upstream_teams: List of teams that can play in next module.
     *      (the order of the array presents the rank of the teams in this module)
     */
    onFinish() {}

    updateModules() {
        if (this.state === State.FINISHED) {
            this.upstream_teams = [];
        }
        this.games = [];
        this.stats = [];
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
    moduleBuilder(): { last: boolean; modules: Module[] | null } {
        return { modules: null, last: true };
    }

    /**
     * Generate inner modules/games. Games will be generated, if all submodules are finished.
     */
    gameBuilder(): { last: boolean; games: Module[] | null } {
        return { games: null, last: true };
    }

    /**
     * Generating submodules and invoking them.
     */
    resolveSubModules() {
        while (true) {
            const result = this.moduleBuilder();
            if (result.modules != null) {
                this.modules = [...this.modules, ...result.modules];
            }
            if (result.last !== false) break;
        }
        this.modules.forEach((e) => e.invoke());
    }

    /**
     * Generating games and invoking them.
     */
    resolveGames() {
        while (true) {
            const result = this.gameBuilder();
            if (result.games != null) {
                //cache teams in games for stats generation

                this.games = [...this.games, ...result.games];
            }
            if (result.last !== false) break;
        }
        this.games.forEach((e) => e.invoke());
    }

    /**
     * Finishing up the current module
     */
    finish() {
        this.onFinish();
        this.master?.refreshGameState();
    }

    invokeStats() {
        this.stats_cache = {
            games: [],
        };
        this.games.forEach((game) =>
            game.downstream_teams.forEach((team) => {
                if (
                    this.stats?.findIndex((st) => st.team.id === team.id) === -1
                ) {
                    this.stats?.push({
                        team: team,
                        wins: 0,
                        loses: 0,
                        scored: 0,
                        conceded: 0,
                    });
                }
            })
        );
    }

    /*
     * This is a default implementation, if it is not sufficient you're supposed to overwrite it.
     * WARNING: If a team is not part of a module in games, then it won't show up in the stats.
     */
    composeStats(sort : boolean = true) {
        this.games.forEach((game) => {
            const cache_index = this.stats_cache.games.findIndex(
                (g) => g.game === game.id
            );

            //If the game has already been cached, but its values have changed, we may want to adjust the stats accordingly.
            //For this we remove the stats of the cached game from the entire stats
            //and if this game is finished it will be readded with the new values in the next if branch.
            if (cache_index !== -1 && game.changed) {
                this.stats_cache.games[cache_index].stats?.forEach((st) => {
                    const index = this.stats.findIndex(
                        (st2) => st2.team.id === st.team.id
                    );
                    if (index !== -1) {
                        this.stats[index] = subtractStats(
                            this.stats[index],
                            st
                        );
                    }
                });
            }

            //If there is no value cached, we assume this game is not yet inclueded in the stats.
            //Thus we want to included it iff it is finished
            if (
                (cache_index === -1 || game.changed) &&
                game.state === State.FINISHED
            ) {
                game.stats?.forEach((st) => {
                    const index = this.stats.findIndex(
                        (st2) => st2.team.id === st.team.id
                    );
                    if (index !== -1) {
                        this.stats[index] = addStats(this.stats[index], st);
                    }
                });

                const cg = {
                    game: game.id,
                    stats: game.stats,
                }
                if (cache_index === -1) {
                    this.stats_cache.games.push(cg);
                } else {
                    this.stats_cache.games[cache_index] = cg;
                }
            }
        });

        //TODO: Merge this into the previous code, to avoid explicit sorting.
        if(sort) sortStats(this.stats, this.games);
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
        const clear = (list: Module[]) =>
            list.forEach((m) => (m.changed = false));

        switch (this.state) {
            case State.STARTED:
                if (this.modules.some((value) => value.changed)) {
                    this.updateModules();
                }
                break;

            case State.FINISHED:
                if (this.modules.some((value) => value.changed)) {
                    this.updateModules();
                }

                if (this.games.some((value) => value.changed)) {
                    this.updateGames();
                }
                break;
        }

        if (this.changed) {
            this.composeStats();
        }

        clear(this.games);
        clear(this.modules);

        if (this.changed && this.state == State.FINISHED) {
            this.finish();
        } else if (this.changed) {
            this.master?.refreshGameState();
        }

        //
        //Generating Modules based on state:
        //
        if (this.state === State.INIT) {
            if (this.modules.every((value) => value.state === State.FINISHED)) {
                this.state = State.STARTED;
                this.resolveGames();
                this.invokeStats();
            }
        }

        if (this.state == State.STARTED) {
            this.composeStats();
            if (this.games.every((value) => value.state === State.FINISHED)) {
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
            modules: this.modules.map((e) => e.structure()),
            games: this.games.map((e) => e.structure()),
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
