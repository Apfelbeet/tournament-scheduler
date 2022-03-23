import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/grpc/grpc_api.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/navigation/snackbar.dart';

class Server {
  final String url;
  final int port;
  final ScaffoldMessengerState messenger;

  late GrpcAPI api;

  ServerState state = ServerState();

  EventChannel events = EventChannel();

  Server({required this.url, required this.port, required this.messenger});

  Future<void> connect() async {
    api = GrpcAPI(address: url, port: port);
    await api.connect(_onServerEvent);

    final modes = await api.serverAPI.getModes();
    final previewTournaments = await api.serverAPI.getTournaments();

    state =
        state.copyWith(modes: modes, previewTournaments: previewTournaments);
  }

  void _onServerEvent(ServerEvent e) {
    debugPrint(e.toProto3Json().toString());
    switch (e.whichEvent()) {
      case ServerEvent_Event.tournaments:
        state = state.copyWith(previewTournaments: e.tournaments.keys);
        //Notifier.serverNotifier.notify();
        events.raise();
        break;
      case ServerEvent_Event.error:
        messenger.showError(e.error);
        debugPrint('Error ${e.error}');
        break;
      case ServerEvent_Event.notSet:
        break;
    }
  }

  close() {
    //Close all tournaments and their views
    //Close own views
    //Close connection?
  }
}

class ServerState with ChangeNotifier {
  final List<Mode> modes;
  final List<String> previewTournaments;

  ServerState({this.modes = const [], this.previewTournaments = const []});

  static Mode getModeById(List<Mode> modes, int id) {
    final index = modes.indexWhere((element) => id == element.id);
    if(index != -1)
      return modes[index];
    return modes[0]; //FIXME TODO
  }

  copyWith({
    List<Mode>? modes,
    List<String>? previewTournaments,
  }) =>
      ServerState(
          modes: modes ?? this.modes,
          previewTournaments: previewTournaments ?? this.previewTournaments);
}
