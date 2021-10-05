import { Module } from "./module";
import { Team, TeamId } from "../../types/general_types";
import { ModuleId, State } from "../../types/module_types";
import { TournamentFacade } from "../tournament_facade";

/**
 * Game is an terminal module, it has no submodules and only one game between two teams.
 */
export default class Game extends Module {
    constructor(tournament: TournamentFacade, master: ModuleId, downstream_teams: TeamId[]) {
        super(tournament, master, downstream_teams);
        this.type = "game";
    }

    invoke() {
        this.state = State.STARTED;
    }

    invokeStats() {
        this.stats = [
            {
                team: this.downstream_teams[0],
                wins: 0,
                loses: 0,
                scored: 0,
                conceded: 0,
            },
            {
                team: this.downstream_teams[1],
                wins: 0,
                loses: 0,
                scored: 0,
                conceded: 0,
            },
        ];
    }

    composeStats() {
        if (this.additional_attributes.result !== undefined) {
            this.stats = [
                {
                    team: this.downstream_teams[0],
                    wins: this.additional_attributes.result.a >= this.additional_attributes.result.b ? 1 : 0,
                    loses: this.additional_attributes.result.a >= this.additional_attributes.result.b ? 0 : 1,
                    scored: this.additional_attributes.result.a,
                    conceded: this.additional_attributes.result.b,
                },
                {
                    team: this.downstream_teams[1],
                    wins: this.additional_attributes.result.a >= this.additional_attributes.result.b ? 0 : 1,
                    loses: this.additional_attributes.result.a >= this.additional_attributes.result.b ? 1 : 0,
                    scored: this.additional_attributes.result.b,
                    conceded: this.additional_attributes.result.a,
                },
            ];
        }
    }

    setResult(a: number, b: number) {
        const res = { a: a, b: b };
        if (
            this.additional_attributes.result !== undefined &&
            JSON.stringify(this.additional_attributes.result) !== JSON.stringify(res)
        ) {
            this.changed = true;
        }
        this.additional_attributes.result = res;
        this.refreshGameState();
    }

    onFinish() {
        if (this.additional_attributes.result !== undefined) {
            //Creating upstream
            if (this.additional_attributes.result.a >= this.additional_attributes.result.b) {
                this.upstream_teams = [
                    this.downstream_teams[0],
                    this.downstream_teams[1],
                ];
            } else {
                this.upstream_teams = [
                    this.downstream_teams[1],
                    this.downstream_teams[0],
                ];
            }
        } else {
            throw new Error("onFinish(), but data is undefined");
        }

    }

    validInput() {
        return this.downstream_teams.length == 2;
    }
}
