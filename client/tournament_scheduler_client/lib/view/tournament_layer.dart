import 'package:tournament_scheduler_client/control/notifier.dart';
import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:tournament_scheduler_client/main.dart';
import 'package:tournament_scheduler_client/view/error_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_view.dart';
import 'mode_view.dart';
import 'team_view.dart';

class TournamentLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _tabs = <Widget>[
      ModeView(),
      TeamView(),
      GameView(),
    ];

    final _tabsIcons = [
      Tab(icon: Icon(Icons.widgets), text: "modes"),
      Tab(icon: Icon(Icons.people), text: "teams"),
      Tab(icon: Icon(Icons.play_arrow), text: "games"),
    ];

    return NotifierInit(
        child: DefaultTabController(
            length: _tabs.length,
            child: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () {
                    ErrorMessageWidget.currentLayer--;
                    Navigator.pop(context);
                    Storage.instance().unsubscribe();
                  },
                ),
                bottom: TabBar(tabs: _tabsIcons),
                title: Text(Storage.instance().getActiveKey() ?? ""),
                actions: [
                  IconButton(
                      icon: Consumer<InfoNotifier>(
                        builder: (context, value, child) => Icon(
                            Storage.instance().isStarted() != null && Storage.instance().isStarted()!
                                ? Icons.stop
                                : Icons.play_arrow),
                      ),
                      onPressed: () => Storage.instance().isStarted() != null && Storage.instance().isStarted()!
                          ? Storage.instance().resetTournament()
                          : Storage.instance().startTournament())
                ],
              ),
              body: ErrorMessageWidget(
                layer: 2,
                child: TabBarView(
                  children: _tabs,
                ),
              )
            )));
  }
}
