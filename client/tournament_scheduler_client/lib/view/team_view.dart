import 'package:tournament_scheduler_client/control/model.dart';
import 'package:tournament_scheduler_client/control/notifier.dart';
import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TeamNotifier>(
        builder: (context, n, c) => Consumer<InfoNotifier>(
          builder: (context, n, c) => ListView(
                children: _tiles(),
              ),
        ));
  }

  List<Widget> _tiles() {
    List<Widget> list = [];
    list.addAll(_TeamViewTile.fromModels(Storage.instance().getTeams()));
    if(Storage.instance().isStarted() != true) list.add(_NewTeamTile());
    return list;
  }
}

class _TeamViewTile extends StatelessWidget {
  final TeamModel model;

  _TeamViewTile(this.model);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.name),
      trailing: Storage.instance().isStarted() != true ? IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          Storage.instance().removeTeam(model.id);
        },
      ): null,
      selected: Storage.instance().getWinner() == model.id,
    );
  }

  static List<_TeamViewTile> fromModels(List<TeamModel> teams) {
    return teams.map((e) => _TeamViewTile(e)).toList();
  }
}

class _NewTeamTile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewTeamTileState();
}

class _NewTeamTileState extends State<_NewTeamTile> {
  bool write = false;

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (!write)
      return ListTile(
        title: Text("add new team",
            textAlign: TextAlign.center,
            ),
        onTap: () {
          setState(() {
            write = true;
          });
        },
      );
    else
      return ListTile(
          title: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              autofocus: true,
              controller: controller,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              _submit(context);
            },
          )
        ],
      ));
  }

  _submit(BuildContext context) {
    if (controller.text.isNotEmpty) {
      setState(() {
        Storage.instance().addTeam(controller.text);
        controller.clear();
        write = false;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
