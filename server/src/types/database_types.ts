
import { Stats } from "./datatypes/stats";
import { Team, TeamId } from "./general_types";
import { ModuleId, State } from "./module_types";
import { Permission, PermissionKey, Sync } from "./tournament_types";

export type ModuleImage = {
    id: ModuleId,
    type: string,
    master: ModuleId | null,
    downstream_teams: TeamId[],
    upstream_teams: TeamId[],
    modules: ModuleId[],
    games: ModuleId[],
    stats: Stats[],
    state: State,
    visible: boolean,
    label: string,
    additional_attributes: any
}

export type TournamentImage = {
    sync: Sync,
    entry?: ModuleImage,
    mode?: number,
    teams: Team[],
    new_team_id: TeamId,
    winner?: TeamId,
    modules: ModuleImage[],
    new_module_id: ModuleId,
}