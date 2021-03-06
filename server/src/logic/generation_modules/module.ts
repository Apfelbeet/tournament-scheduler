import { TeamId } from "../../types/general_types";
import { State, Structure, CachedStats, ModuleId} from "../../types/module_types";
import { addStats, sortStats, subtractStats, Stats, emptyStats} from "../../types/datatypes/stats";
import { TournamentFacade } from "../tournament_facade";

export class Module {
    
    tournament: TournamentFacade;
    
    /**
     * The master node will be notified in the onFinish-Event.
     */
    master: ModuleId | null;

    /**
     * Downstream teams are first divided into the submodules.
     * The resulting upstream is then used to build "game" modules.
     */
    downstream_teams: TeamId[];

    upstream_teams: TeamId[];

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

    modules: ModuleId[];

    games: ModuleId[];

    stats: Stats[];
    stats_cache: {
        games: CachedStats[];
    };

    additional_attributes: any;

    changed: boolean;

    /**
     * The type shows the type of the module.
     * This can help to filter for certain modules and can be used by the UI to make different representations of the modules.
     * Therefore, if you want to give the module special treatment, you should rename this attribute uniquely.
     */
    type: string;

    constructor(
        tournament: TournamentFacade,
        master: ModuleId | null,
        teams: TeamId[],
        type: string,
        visible: boolean = true,
        label: string = "unnamed"
    ) {
        this.tournament = tournament;
        this.master = master;
        this.downstream_teams = teams;
        this.state = State.PREINIT;
        this.id = tournament.newModuleId();
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
        this.additional_attributes = {};
        this.type = type;
    }

    /**
     * Called to finish up the current module:
     *  - determine upstream_teams: List of teams that can play in next module.
     *      (the order of the array presents the rank of the teams in this module)
     */
    onFinish() {}

    /**
     * Generate submodules. Submodule will be generated before the actual games of this module
     */
    moduleBuilder(): Module[] {
        return [];
    }

    /**
     * Generate inner modules/games. Games will be generated, if all submodules are finished.
     */
    gameBuilder(): Module[]  {
        return [];
    }

    /**
     * Generating submodules and invoking them.
     */
    resolveSubModules() {
        this.modules = this.moduleBuilder().map(m => this.tournament.registerNewModule(m));
        this.modules.forEach((e) => this.tournament.getModule(e).invoke());
    }

    /**
     * Generating games and invoking them.
     */
    resolveGames() {
        this.games = this.gameBuilder().map(m => this.tournament.registerNewModule(m));
        this.games.forEach((e) => this.tournament.getModule(e).invoke());
    }

    /**
     * Finishing up the current module
     */
    finish() {
        this.changed = true;
        this.onFinish();
        if (this.master !== null)
            this.tournament.getModule(this.master).notify();
    }

    invokeStats() {
        this.stats_cache = {
            games: [],
        };

        this.tournament.getModules(this.games).forEach((game: Module) =>
            game.downstream_teams.forEach((team) => {
                if (this.stats?.findIndex((st) => st.team === team) === -1) {
                    this.stats?.push(emptyStats(team));
                }
            })
        );
    }

    /*
     * This is a default implementation. If it is not sufficient, you're supposed to overwrite it.
     * WARNING: If a team is not part of a module in games, then it won't show up in the stats.
     */
    composeStats(sort : boolean = true) {
        const games = this.tournament.getModules(this.games);

        games.forEach((game) => {
            const cache_index = this.stats_cache.games.findIndex(
                (g) => g.game === game.id
            );

            //If the game has already been cached, but its values have changed, we may want to adjust the stats accordingly.
            //For this we remove the stats of the cached game from the entire stats
            //and if this game is finished it will be readded with the new values in the next if branch.
            if (cache_index !== -1 && game.changed) {
                this.stats_cache.games[cache_index].stats?.forEach((st) => {
                    const index = this.stats.findIndex(
                        (st2) => st2.team === st.team
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
                        (st2) => st2.team === st.team
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
        //TODO: Why does this not sort?
        if(sort) sortStats(this.stats, games);
    }

    /**
     * Invoking the module: Set Game-State and generate Submodules
     */
    invoke() {
        this.state = State.INIT;
        this.resolveSubModules();
        this.notify();
    }

    notify() {
        //Currently we just ignore changed submodules
        resetClearFlags(this.modules, this.tournament);
        

        if (this.state === State.INIT) {
            if (allModulesFinished(this.modules, this.tournament)) {
                this.state = State.STARTED;
                this.resolveGames();
                this.invokeStats();
            }

        }


        if (this.state >= State.STARTED) {
            if (moduleChanged(this.games, this.tournament)) {
                this.composeStats();
                resetClearFlags(this.games, this.tournament);
            }

            if (this.state === State.FINISHED || allModulesFinished(this.games, this.tournament)) {
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
            modules: this.modules,
            games: this.games,
            down: this.downstream_teams,
            up: this.upstream_teams,
            stats: this.stats,
            data: this.additional_attributes,
        };
    }

    /**
     * Can be used to check, if this module works with the given input.
     */
    validInput(): boolean {
        return true;
    }
}

function allModulesFinished(modules: ModuleId[], tournament: TournamentFacade): boolean {
    return tournament.getModules(modules).every((value) => value.state === State.FINISHED);
}

function moduleChanged(modules: ModuleId[], tournament: TournamentFacade): boolean {
    return modules.some((value) => tournament.getModule(value).changed)
}

function resetClearFlags(modules: ModuleId[], tournament: TournamentFacade): void {
    tournament.getModules(modules).forEach((m) => (m.changed = false));
}