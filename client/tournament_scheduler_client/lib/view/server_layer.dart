import 'package:tournament_scheduler_client/control/notifier.dart';
import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:tournament_scheduler_client/main.dart';
import 'package:tournament_scheduler_client/view/error_message_widget.dart';
import 'package:tournament_scheduler_client/view/menu.dart';
import 'package:tournament_scheduler_client/view/tournament_layer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServerLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Storage.instance().getUrl() ?? ""),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => TournamentCreationDialog().show(context)),
          ],
        ),
        body: ErrorMessageWidget(
          layer: 1,
          child: NotifierInit(
            child: Consumer<ServerNotifier>(
                builder: (context, value, child) => ListView(
                      children: Storage.instance()
                          .getKeys()
                          .map((e) => _keyToWidget(context, e))
                          .toList(growable: false),
                    )),
          ),
        ));
  }
}

Widget _keyToWidget(BuildContext context, String key) => ListTile(
      title: Text(key),
      onTap: () {
        ErrorMessageWidget.currentLayer++;
        Storage.instance().subscribe(key);
        Navigator.push(
            context,
            MaterialPageRoute(

                //Open new layer
                builder: (_) => TournamentLayer()));
      },
    );
