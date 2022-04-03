import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/control/server.dart';
import 'package:tournament_scheduler_client/control/tournament.dart';
import 'package:tournament_scheduler_client/control/tournament_state.dart';
import 'package:tournament_scheduler_client/navigation/app_router.dart';
import 'package:tournament_scheduler_client/navigation/snackbar.dart';

class ServerLayer extends StatelessWidget {
  final Server server;

  ServerLayer({required this.server});

  @override
  Widget build(BuildContext context) {
    return Provider<Server>.value(
      value: server,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Tournament Scheduler"),
            actions: [
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _createTournament(context)),
            ],
          ),
          body: EventBuilder(
              channel: server.events,
              builder: (context) {
                return ListView(
                  children: server.state.previewTournaments
                      .map((name) => TournamentPreview(name: name))
                      .toList(growable: false),
                );
              })),
    );
  }

  void _createTournament(BuildContext context) async {
    final TournamentCreate? tc =
        await Navigator.of(context).openTournamentCreation();

    if (tc != null) {
      server.createTournament(tc.key);
    }
  }
}

class TournamentPreview extends StatelessWidget {
  final String name;

  const TournamentPreview({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Server server = context.read<Server>();

    return ListTile(
      title: Text(name),
      onTap: () async {
        try{
          TournamentState state = await Tournament.loadInitialState(server, name);
          Tournament tournament = new Tournament(name, server, state);
          Navigator.of(context).openTournament(tournament);
        } on Exception catch (e){
          server.messenger.showError(e.toString());
        }
      },
    );
  }
}
