import 'package:tournament_scheduler_client/control/notifier.dart';
import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:tournament_scheduler_client/main.dart';
import 'package:tournament_scheduler_client/view/error_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_scheduler_client/view/menu.dart';

import 'game_view.dart';
import 'mode_view.dart';
import 'team_view.dart';

class TournamentLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotifierInit(
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                ErrorMessageWidget.currentLayer--;
                Navigator.pop(context);
                Storage.instance().unsubscribe();
              },
            ),
            title: Text(Storage.instance().getActiveKey() ?? ""),
          ),
          body: ErrorMessageWidget(
            layer: 1,
            child: GameView(),
          )
        ));
  }
}
