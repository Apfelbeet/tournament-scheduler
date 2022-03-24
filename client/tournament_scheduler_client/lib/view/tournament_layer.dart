import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/tournament.dart';

import 'game_view.dart';
import 'mode_view.dart';
import 'team_view.dart';

class TournamentLayer extends StatelessWidget {
  final Tournament tournament;

  TournamentLayer({required this.tournament});

  @override
  Widget build(BuildContext context) {
    final _tabs = <Widget>[
      ModeView(tournament),
      TeamView(tournament),
      GameView(tournament),
    ];

    final _tabsIcons = [
      const Tab(icon: const Icon(Icons.widgets), text: "modes"),
      const Tab(icon: const Icon(Icons.people), text: "teams"),
      const Tab(icon: const Icon(Icons.play_arrow), text: "games"),
    ];

    return Provider<Tournament>.value(
      value: tournament,
      child: DefaultTabController(
          length: _tabs.length,
          child: WillPopScope(
            onWillPop: _onPop,
            child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(tabs: _tabsIcons),
                  title: Text(tournament.key),
                  actions: [
                    EventBuilder(
                        channel: tournament.statusEvents,
                        builder: (context) {
                          return IconButton(
                              icon: Icon(tournament.state.started
                                  ? Icons.stop
                                  : Icons.play_arrow),
                              onPressed: () => tournament.state.started
                                  ? tournament.reset(
                                      tournament.key, tournament.state.sync)
                                  : tournament.start(
                                      tournament.key, tournament.state.sync));
                        })
                  ],
                ),
                body: TabBarView(
                  children: _tabs,
                )),
          )),
    );
  }

  Future<bool> _onPop() async {
    tournament.server.api.unsubscribeTournament(tournament.key);
    return true;
  }
}
