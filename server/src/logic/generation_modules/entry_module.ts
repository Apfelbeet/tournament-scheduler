import { Module } from "./module";
import { TeamId } from "../../types/general_types";
import { ModuleId, State, Structure } from "../../types/module_types";
import { TournamentFacade } from "../tournament_facade";

export default class Entry extends Module {
    constructor(
        tournament: TournamentFacade,
        master: ModuleId | null,
        teams: TeamId[],
    ) {
        super(tournament, master, teams, "entry", true, "entry");
    }


    setEntryModule(
        entryModule: any
    ) {
        this.additional_attributes.entryModule = this.tournament.registerNewModule(
            new entryModule.default(
                this.tournament,
                this.id,
                this.downstream_teams,
                true
            )
        );
    }

    structure(): Structure {
        return {
            id: this.id,
            type: this.type,
            label: this.label,
            visible: this.visible,
            state: this.state,
            modules: [this.additional_attributes.entryModule],
            games: [],
            down: [],
            up: [],
            data: undefined,
        };
    }

    moduleBuilder(): { last: boolean; modules: Module[] | null } {
        return {
            modules: [
                this.tournament.getModule(
                    this.additional_attributes.entryModule
                ),
            ],
            last: true,
        };
    }

    onFinish() {
        this.upstream_teams = this.tournament.getModule(
            this.additional_attributes.entryModule
        ).upstream_teams;
    }

    validInput() {
        return this.tournament
            .getModule(this.additional_attributes.entryModule)
            .validInput();
    }

    refreshGameState() {
        if (
            this.tournament.getModule(this.additional_attributes.entryModule)
                .state !== State.FINISHED
        ) {
            this.upstream_teams = [];
        }
        super.refreshGameState();
    }
}
