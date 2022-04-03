import { ModuleImage, TournamentImage } from "../types/database_types";
import { Module } from "../logic/generation_modules/module";
import * as config from "../logic/server_config";
import { Tournament } from "../logic/tournament";
import { TournamentFacade } from "../logic/tournament_facade";
import { Mode, Team } from "../types/general_types";
import Entry from "../logic/generation_modules/entry_module";
import { Permission } from "../types/tournament_types";

function instanceModule(
    tournament: TournamentFacade,
    data: ModuleImage
): Module {
    const moduleFile = config.getLexicon().get(data.type);
    if (moduleFile === undefined) {
        throw Error(`Can not load "${data.type}"!`);
    } else {
        const module = new (moduleFile as any).default(
            tournament,
            data.master,
            data.downstream_teams
        ) as Module;

        for (const [key, value] of Object.entries(data)) {
            (module as any)[key] = value;
        }

        return module;
    }
}

function imageOfModule(module: Module): ModuleImage {
    return {
        id: module.id,
        type: module.type,
        master: module.master,
        downstream_teams: module.downstream_teams,
        upstream_teams: module.upstream_teams,
        modules: module.modules,
        games: module.games,
        stats: module.stats,
        state: module.state,
        visible: module.visible,
        label: module.label,
        additional_attributes: module.additional_attributes,
    };
}

export function instanceTournament(data: TournamentImage): Tournament {
    const tournament = new Tournament();
    const facade = new TournamentFacade(tournament);

    tournament.sync = data.sync;
    if (data.entry !== undefined)
        tournament.entry = instanceModule(facade, data.entry!) as Entry;

    if (data.mode !== undefined) {
        const mode = config
            .getModes()
            .find((mode: Mode) => mode.id === data.mode);
        tournament.mode = mode;
    }

    data.teams.forEach((t: Team) => tournament.teams.set(t.id, t));

    tournament.new_team_id = data.new_team_id;

    tournament.winner = data.winner;

    data.modules.forEach((mi: ModuleImage) =>
        tournament.modules.set(mi.id, instanceModule(facade, mi))
    );

    tournament.new_module_id = data.new_module_id;

    return tournament;
}

export function imageOfTournament(t: Tournament): TournamentImage {
    return {
        sync: t.sync,
        entry: t.entry !== undefined ? imageOfModule(t.entry!) : undefined,
        mode: t.mode?.id,
        teams: Array.from(t.teams.values()),
        new_team_id: t.new_team_id,
        winner: t.winner,
        modules: Array.from(t.modules.values()).map((m) => imageOfModule(m)),
        new_module_id: t.new_module_id,
    };
}
