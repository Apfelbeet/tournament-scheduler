import { Module } from "./module";
import { TeamId } from "../../types/general_types";
import { ModuleId, State } from "../../types/module_types";
import { TournamentFacade } from "../tournament_facade";
import { UserInputError } from "../../util/errors";
import { statsWith, emptyStats, sortStats } from "../../types/datatypes/stats";

/**
 * Game is an terminal module, it has no submodules and only one game between two teams.
 */
export default class Game extends Module {
    constructor(
        tournament: TournamentFacade,
        master: ModuleId,
        teams: TeamId[]
    ) {
        super(tournament, master, teams, "game");
    }

    invoke() {
        this.state = State.STARTED;
    }

    invokeStats() {
        this.stats = [
            emptyStats(this.downstream_teams[0]),
            emptyStats(this.downstream_teams[1]),
        ];
    }

    composeStats() {
        this.invokeStats(); //FIXME: RefreshGameState calls composeStats() before calling invokeStats(). This is not right.

        //This game doesn't support draws, but it still manages draws in the
        //stats.
        if (
            this.additional_attributes.result.a ===
            this.additional_attributes.result.b
        ) {
            this.stats = [
                statsWith(this.stats[0], {
                    points: 1,
                    wins: 0,
                    loses: 0,
                    draws: 1,
                }),
                statsWith(this.stats[1], {
                    points: 1,
                    wins: 0,
                    loses: 0,
                    draws: 1,
                }),
            ];
        } else {
            const winner =
                this.additional_attributes.result.a >=
                this.additional_attributes.result.b
                    ? 0
                    : 1;
            const loser =
                this.additional_attributes.result.a >=
                this.additional_attributes.result.b
                    ? 1
                    : 0;

            this.stats[winner] = statsWith(this.stats[winner], {
                points: 3,
                wins: 1,
                loses: 0,
                draws: 0,
            });

            this.stats[loser] = statsWith(this.stats[loser], {
                points: 0,
                wins: 0,
                loses: 1,
                draws: 0,
            });
        }

        this.stats[0].scored = this.additional_attributes.result.a;
        this.stats[0].conceded = this.additional_attributes.result.b;

        this.stats[1].scored = this.additional_attributes.result.b;
        this.stats[1].conceded = this.additional_attributes.result.a;

        sortStats(this.stats);
    }

    setResult(a: number, b: number) {
        this.checkUserInput(a, b);

        const res = { a: a, b: b };

        this.changed = true;

        //If set a value, but it is the same as before, we can just discard it.
        if (
            this.additional_attributes.result === undefined ||
            JSON.stringify(this.additional_attributes.result) !==
                JSON.stringify(res)
        ) {
            this.additional_attributes.result = res;
            this.composeStats();
            this.notify();
        }
    }

    onFinish() {
        if (this.additional_attributes.result !== undefined) {
            //Creating upstream
            if (
                this.additional_attributes.result.a >=
                this.additional_attributes.result.b
            ) {
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

    checkUserInput(a: number, b: number) {
        if (a === b) {
            throw new UserInputError("The game can not be a draw!");
        }
    }
}
