import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tournament_scheduler_client/control/model.dart';
import 'package:tournament_scheduler_client/control/server.dart';

import '../generated/proto/logic_api.pb.dart';

class TournamentState {
  final String sync;
  final bool started;
  final Mode activeMode;
  final TeamData? winnerTeam;
  final List<TeamData> teams;
  final StructureState? structure;

  TournamentState({
    required this.sync,
    required this.started,
    required this.activeMode,
    this.winnerTeam,
    required this.teams,
    this.structure,
  });

  TeamData getTeamById(int id) => teams.firstWhere((team) => team.id == id);

  TournamentState copyWith({
    String? sync,
    bool? started,
    Mode? activeMode,
    TeamData? winnerTeam,
    bool resetWinner = false,
    List<TeamData>? teams,
    StructureState? structure,
    bool resetStructure = false,
  }) =>
      TournamentState(
          sync: sync ?? this.sync,
          started: started ?? this.started,
          activeMode: activeMode ?? this.activeMode,
          teams: teams ?? this.teams,
          winnerTeam: resetWinner ? null : winnerTeam ?? this.winnerTeam,
          structure: resetStructure ? null : structure ?? this.structure);

  static TournamentState initial(TournamentData data, List<Mode> modes) {
    final sync = data.sync;

    final teams = data.teams.teams;

    final activeMode = ServerState.getModeById(modes, data.status.mode);

    final TeamData? winnerTeam = data.status.hasWinner() ?
    teams.firstWhere((element) => data.status.winner == element.id)
        : null;

    final started = data.status.started;

    print(data.structure.structures);
    final StructureState? structure = data.hasStructure()
        ? StructureState.fromEventData(data.structure.structures, teams)
        : null;

    return TournamentState(sync: sync,
      started: started,
      activeMode: activeMode,
      teams: teams,
      structure: structure,
      winnerTeam: winnerTeam,
    );
  }
}

class StructureState {
  final Map<int, StructureData> modules;
  final Map<int, GameModel> games;
  final Map<int, List<int>> moduleToGames;
  final int entry;

  StructureState({
    required this.modules,
    required this.games,
    required this.entry,
    required this.moduleToGames,
  });

  StructureData? getModule(int id) => modules[id];

  GameModel? getGame(int id) => games[id];

  static StructureState? fromEventData(List<StructureData> data,
      List<TeamData> teams) {
    int? entry;
    Map<int, StructureData> modules = new Map();
    Map<int, GameModel> games = new Map();
    Map<int, List<int>> moduleToGames = new Map();

    if(data.length == 0) return null;

    bool first = true;
    for (StructureData module in data) {
      if (first) {
        entry = module.id;
        first = false;
      }

      modules[module.id] = module;
      if (module.type == "game") {
        Map<String, dynamic> gameData = jsonDecode(module.data);

        final String teamAName = teams
            .firstWhere((team) => team.id == module.down[0])
            .name;
        final String teamBName = teams
            .firstWhere((team) => team.id == module.down[1])
            .name;

        int? resultA, resultB;
        if(gameData["result"] != null) {
          resultA = gameData["result"]["a"];
          resultB = gameData["result"]["b"];
        }

        games[module.id] = GameModel(module.id, teamAName, teamBName,
            resultA: resultA, resultB: resultB);
      }
    }

    if (entry != null)
      _assignGamesToModule(entry, null, modules, games, moduleToGames);

    return StructureState(
        entry: entry!,
        modules: modules,
        games: games,
        moduleToGames: moduleToGames);
  }

  StructureState copyWith({
    Map<int, StructureData>? modules,
    Map<int, GameModel>? games,
    Map<int, List<int>>? moduleToGames,
    int? entry,
  }) =>
      StructureState(
          modules: modules ?? this.modules,
          games: games ?? this.games,
          entry: entry ?? this.entry,
          moduleToGames: moduleToGames ?? this.moduleToGames);

  static void _assignGamesToModule(int id,
      int? parent,
      Map<int, StructureData> modules,
      Map<int, GameModel> games,
      Map<int, List<int>> moduleToGames) {
    final module = modules[id];
    if (module == null) return;

    final int par = parent == null || module.visible ? id : parent;

    for (int childId in [...module.modules, ...module.games]) {
      if (games.containsKey(childId)) {
        moduleToGames.putIfAbsent(par, () => []);
        moduleToGames[par]!.add(childId);
      }

      if (modules.containsKey(childId)) {
        _assignGamesToModule(childId, par, modules, games, moduleToGames);
      }
    }
  }
}