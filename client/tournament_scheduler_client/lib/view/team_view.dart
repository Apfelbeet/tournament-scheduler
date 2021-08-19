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
    if (Storage.instance().isStarted() != true) list.add(_NewTeamTile());
    return list;
  }
}

class _TeamViewTile extends StatefulWidget {
  final TeamModel model;

  _TeamViewTile(this.model);

  @override
  _TeamViewTileState createState() => _TeamViewTileState();

  static List<_TeamViewTile> fromModels(List<TeamModel> teams) {
    return teams.map((e) => _TeamViewTile(e)).toList();
  }
}

class _TeamViewTileState extends State<_TeamViewTile> {
  bool write = false;
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: write ? TextField(controller: controller, autofocus: true,) : Text(widget.model.name),
      trailing: Storage.instance().isStarted() != true
          ? Wrap(
              children: [
                IconButton(
                  icon: write ? Icon(Icons.arrow_forward) : Icon(Icons.edit),
                  onPressed: () {
                    if (write && controller.text.isNotEmpty) {
                      Storage.instance().editTeam(widget.model.id, controller.text);
                    } else {
                      controller.text = widget.model.name;
                    }
                    setState(() {
                      write = !write;
                    });
                  }),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    Storage.instance().removeTeam(widget.model.id);
                  },
                ),
              ],
            )
          : null,
      selected: Storage.instance().getWinner() == widget.model.id,
    );
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Divider(
            thickness: 1,
          ),
        ),
        if (!write)
          ListTile(
            trailing: IconButton(
                icon: Icon(Icons.person_add),
                onPressed: () {
                  setState(() {
                    write = true;
                  });
                }),
          )
        else
          ListTile(
            title: TextField(
              autofocus: true,
              controller: controller,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                _submit(context);
              },
            ),
          )
      ],
    );
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
