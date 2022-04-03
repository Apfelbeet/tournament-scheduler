import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/control/permission.dart';
import 'package:tournament_scheduler_client/control/tournament.dart';
import 'package:tournament_scheduler_client/view/loadingscreen.dart';
import 'package:tournament_scheduler_client/navigation/app_router.dart';

import 'game_view.dart';
import 'mode_view.dart';
import 'team_view.dart';

class TournamentLayerLoader extends StatelessWidget {
  final Tournament tournament;
  late final Future<PERMISSION> permission;

  TournamentLayerLoader(
      {required this.tournament, required NavigatorState navigator}) {
    permission = tournament.getCurrentPermission().then((value) {
      navigator.exitLoadingToTournament(tournament, value);
      return value;
    }).catchError((e) {
      navigator.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen.app(
      action: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop()),
    );

    // return FutureBuilder<PERMISSION>(
    //   future: permission,
    //   builder: (BuildContext context, AsyncSnapshot<PERMISSION> snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.none:
    //         Navigator.of(context).pop();
    //         break;
    //       case ConnectionState.waiting:
    //       case ConnectionState.active:
    //         break;
    //       case ConnectionState.done:
    //         Navigator.of(context).exitLoadingToTournament(tournament, snapshot.data!);
    //     }
    //   },
    // );
  }
}

class TournamentLayer extends StatelessWidget {
  final Tournament tournament;
  late final PERMISSION permission;

  TournamentLayer({required this.tournament, required this.permission});

  bool hasPermission(PERMISSION permission) =>
      checkPermission(this.permission, permission);

  @override
  Widget build(BuildContext context) {
    if (!hasPermission(PERMISSION.READ_ONLY)) {
      return Center(
        child: Text("Access denied!"),
      );
    }

    final _tabs = <Widget>[
      if (hasPermission(PERMISSION.MOD)) ModeView(tournament),
      if (hasPermission(PERMISSION.READ_ONLY)) TeamView(tournament),
      if (hasPermission(PERMISSION.READ_ONLY)) GameView(tournament),
    ];

    final _tabsIcons = [
      if (hasPermission(PERMISSION.MOD))
        const Tab(icon: const Icon(Icons.widgets), text: "modes"),
      if (hasPermission(PERMISSION.READ_ONLY))
        const Tab(icon: const Icon(Icons.people), text: "teams"),
      if (hasPermission(PERMISSION.READ_ONLY))
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
                    IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () async {
                          tournament.closeTournament();
                          Navigator.of(context).pop();
                        }),
                    EventBuilder(
                        channel: tournament.statusEvents,
                        builder: (context) {
                          return IconButton(
                              icon: Icon(tournament.state.started
                                  ? Icons.stop
                                  : Icons.play_arrow),
                              onPressed: () => tournament.state.started
                                  ? tournament.reset()
                                  : tournament.start());
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
