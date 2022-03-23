import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/control/server.dart';
import 'package:tournament_scheduler_client/control/tournament_state.dart';
import 'package:tournament_scheduler_client/navigation/snackbar.dart';

class Tournament {
  final String key;
  final Server server;

  TournamentState state;

  final EventChannel gameEvents = EventChannel();
  final EventChannel teamEvents = EventChannel();
  final EventChannel statusEvents = EventChannel();

  Tournament(this.key, this.server, this.state) {
    server.api.subscribeTournament(key, _onTournamentEvent);
  }

  Future<void> reload() async {
    final TournamentData data = (await server.api.tournamentAPI.load(key)).data;
    applyChange(
        sync: data.sync,
        status: data.status,
        teams: data.teams,
        structure: data.structure);
  }

  void _onTournamentEvent(TournamentEvent e) {
    switch (e.whichEvent()) {
      case TournamentEvent_Event.status:
        applyChange(sync: e.sync, status: e.status);
        break;

      case TournamentEvent_Event.teams:
        applyChange(sync: e.sync, teams: e.teams);
        break;

      case TournamentEvent_Event.structure:
        applyChange(sync: e.sync, structure: e.structure);
        break;

      case TournamentEvent_Event.error:
        final error = e.error;
        server.messenger.showError(error);
        break;

      case TournamentEvent_Event.notSet:
        break;
    }
  }

  applyChange({required String sync,
    TournamentStatusData? status,
    TournamentTeamData? teams,
    TournamentStructureData? structure}) {
    TournamentState newState = state.copyWith(sync: sync);
    List<EventChannel> channels = [];

    if (teams != null) {
      newState = newState.copyWith(teams: teams.teams);
      channels.add(teamEvents);
    }

    if (status != null) {
      final activeMode =
      server.state.modes.firstWhere((element) => status.mode == element.id);
      final TeamData? winnerTeam = status.hasWinner()
          ?
      newState.teams.firstWhere((element) => status.winner == element.id)
          : null;

      newState = newState.copyWith(
          started: status.started,
          activeMode: activeMode,
          resetWinner: !status.hasWinner(),
          winnerTeam: winnerTeam);

      channels.add(statusEvents);
    }


    if (structure != null) {
      final newStructureState = StructureState.fromEventData(structure.structures, state.teams);
      newState = state.copyWith(
          structure: newStructureState,
          resetStructure: newStructureState == null,
      );
      channels.add(gameEvents);
    }

    state = newState;
    for (EventChannel channel in channels)
      channel.raise();
  }
}


