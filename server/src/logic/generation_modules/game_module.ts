import { Module } from "./module";
import { Team } from "../../types/general_types";
import { State } from "../../types/module_types";
import * as logger from "../../util/logger";

/**
 * Game is an terminal module, it has no submodules and only one game between two teams.
 */
export default class Game extends Module {
    constructor(master: Module, downstream_teams: Team[]) {
        super(master, downstream_teams);
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
        if (this.data !== undefined) {
            this.stats = [
                {
                    team: this.downstream_teams[0],
                    wins: this.data.a >= this.data.b ? 1 : 0,
                    loses: this.data.a >= this.data.b ? 0 : 1,
                    scored: this.data.a,
                    conceded: this.data.b,
                },
                {
                    team: this.downstream_teams[1],
                    wins: this.data.a >= this.data.b ? 0 : 1,
                    loses: this.data.a >= this.data.b ? 1 : 0,
                    scored: this.data.b,
                    conceded: this.data.a,
                },
            ];
        }
    }

    setResult(a: number, b: number) {
        const res = { a: a, b: b };
        if (
            this.data !== undefined &&
            JSON.stringify(this.data) !== JSON.stringify(res)
        ) {
            this.changed = true;
        }
        this.data = res;
        this.refreshGameState();
    }

    onFinish() {
        if (this.data !== undefined) {
            //Creating upstream
            if (this.data.a >= this.data.b) {
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
