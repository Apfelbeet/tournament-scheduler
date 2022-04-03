import 'package:flutter/cupertino.dart';
import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/control/perferences.dart';
import 'package:tournament_scheduler_client/control/server.dart';
import 'package:tournament_scheduler_client/control/tournament_state.dart';
import 'package:tournament_scheduler_client/navigation/snackbar.dart';

class Tournament {
  final String key;
  final Server server;
  late List<String> permissionKeys;

  TournamentState state;

  final EventChannel gameEvents = EventChannel();
  final EventChannel teamEvents = EventChannel();
  final EventChannel statusEvents = EventChannel();

  Tournament(this.key, this.server, this.state) {
    server.api.subscribeTournament(key, _onTournamentEvent);
    this.permissionKeys = Preferences.getPermissionKeys(key);
  }

  Future<void> reload() async {
    server.messenger.showLoading();
    final TournamentData data = (await server.api.tournamentAPI.load(_access)).data;
    applyChange(
        sync: data.sync,
        status: data.status,
        teams: data.teams,
        structure: data.structure);
  }

  static Future<TournamentState> loadInitialState(Server server, String key) async {
    final TournamentAccess access = TournamentAccess(
      key: key,
      sync: "",
      permissionKeys: Preferences.getPermissionKeys(key),
    );


    final response = await server.api.tournamentAPI.load(access);

    switch(response.whichResponse()) {
      case ResponseTournamentData_Response.data:
        final TournamentData data = response.data;
        final TournamentState state = TournamentState.initial(data, server.state.modes);
        return state;
      case ResponseTournamentData_Response.error:
        throw Exception("${response.error}");
      case ResponseTournamentData_Response.notSet:
        throw Exception("Server didn't send any data!");
    }


  }

  void _onTournamentEvent(TournamentEvent e) {
    // When receiving an update event, which is based on another state,
    // we want to reload the whole state.
    if (e.syncOld != state.sync &&
        e.whichEvent() != TournamentEvent_Event.error) {
      reload();
      return;
    }

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

  applyChange(
      {required String sync,
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
          ? newState.teams.firstWhere((element) => status.winner == element.id)
          : null;

      newState = newState.copyWith(
          started: status.started,
          activeMode: activeMode,
          resetWinner: !status.hasWinner(),
          winnerTeam: winnerTeam);

      channels.add(statusEvents);
    }

    if (structure != null) {
      final newStructureState =
          StructureState.fromEventData(structure.structures, state.teams);
      newState = newState.copyWith(
        structure: newStructureState,
        resetStructure: newStructureState == null,
      );
      channels.add(gameEvents);
    }

    state = newState;
    for (EventChannel channel in channels) channel.raise();
  }

  String processAcknowledgement(Server server, Acknowledgment acknowledgment) {
    switch (acknowledgment.status) {
      case Acknowledgment_Status.OK:
        server.messenger.showOk();
        break;
      case Acknowledgment_Status.ERRROR:
        server.messenger.showError(acknowledgment.message);
        break;
      case Acknowledgment_Status.SYNC_ERROR:
        reload();
        break;
    }
    return acknowledgment.message;
  }

  TournamentAccess get _access => TournamentAccess(
      key: key, sync: state.sync, permissionKeys: permissionKeys);

  void addTeam(String name) async {
    final ack = await server.api.tournamentAPI.addTeam(_access, name);
    processAcknowledgement(server, ack);
  }

  void editTeam(int id, String name) async {
    final ack = await server.api.tournamentAPI.editTeam(_access, id, name);
    processAcknowledgement(server, ack);
  }

  void removeTeam(int id) async {
    final ack = await server.api.tournamentAPI.removeTeam(_access, id);
    processAcknowledgement(server, ack);
  }

  void setMode(int id) async {
    final ack = await server.api.tournamentAPI.setMode(_access, id);
    processAcknowledgement(server, ack);
  }

  void setResult(int id, int scoreA, int scoreB) async {
    final ack =
        await server.api.tournamentAPI.setResult(_access, id, scoreA, scoreB);
    processAcknowledgement(server, ack);
  }

  void start() async {
    final ack = await server.api.tournamentAPI.start(_access);
    processAcknowledgement(server, ack);
  }

  void reset() async {
    final ack = await server.api.tournamentAPI.reset(_access);
    processAcknowledgement(server, ack);
  }

  void unsubscribe() async {
    server.api.tournamentAPI.unsubscribe(key);
  }

  Future<PERMISSION> getCurrentPermission() {
    return server.api.tournamentAPI.getPermission(_access);
  }

  void closeTournament() {
    server.api.serverAPI.removeTournament(_access);
  }
}
