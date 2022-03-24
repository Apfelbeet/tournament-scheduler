import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/tournament.dart';

import '../control/grpc/proto_logic_api.dart';


class ModeView extends StatelessWidget {
  final Tournament tournament;

  ModeView(this.tournament);

  @override
  Widget build(BuildContext context) {
    return EventBuilder(channel: tournament.statusEvents,
        builder: (context) =>
        ListView(
            children: _ModeViewTile.fromModels(tournament.server.state.modes)));
  }
}

class _ModeViewTile extends StatelessWidget {
  final Mode model;

  _ModeViewTile(this.model);

  @override
  Widget build(BuildContext context) {
    Tournament tournament = context.read<Tournament>();

    return ListTile(
      enabled: !tournament.state.started,
      title: Text(this.model.title),
      subtitle: Text(this.model.description),
      onTap: () {
        tournament.setMode(
            tournament.key, tournament.state.sync, model.id);
      },
      selected: tournament.state.activeMode.id == model.id,
    );
  }

  static List<_ModeViewTile> fromModels(List<Mode> modes) {
    return modes.map((e) => _ModeViewTile(e)).toList();
  }
}
