import { Module } from "./module";
import { Team } from "../../types/general_types";
import { State } from "../../types/module_types";

/**
 * Game is an terminal module, it has no submodules and only one game between two teams.
 */
export class Game extends Module {

  constructor(master: Module, downstream_teams: Team[]) {
    super(master, downstream_teams);
    this.type = "game";
  }

  invoke() {
    this.state = State.STARTED;
  }

  setResult(a: number, b: number) {
    const res = { a: a, b: b }
    if(this.data !== undefined && JSON.stringify(this.data) !== JSON.stringify(res)) {
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
    }else {
        throw new Error("onFinish(), but data is undefined");
    }

    //Creating stats
    this.stats = [
      {
        team: this.downstream_teams[0],
        wins: this.data.a >= this.data.b ? 1 : 0,
        loses: this.data.a >= this.data.b ? 0 : 1,
        positive_score: this.data.a,
        negative_score: this.data.b,
      },
      {
        team: this.downstream_teams[1],
        wins: this.data.a >= this.data.b ? 0 : 1,
        loses: this.data.a >= this.data.b ? 1 : 0,
        positive_score: this.data.b,
        negative_score: this.data.a,
      },
    ];
  }

  validInput() {
    return this.downstream_teams.length == 2;
  }
}
