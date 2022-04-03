import 'package:flutter/material.dart';
import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/control/tournament.dart';
import 'package:provider/provider.dart';

class TeamView extends StatelessWidget {
  final Tournament tournament;

  TeamView(this.tournament);

  @override
  Widget build(BuildContext context) {
    return EventBuilder(
        channel: tournament.statusEvents,
        builder: (context) {
          return EventBuilder(
              channel: tournament.teamEvents,
              builder: (context) {
                debugPrint("BUILD!");
                return ListView(
                  children: _tiles(),
                );
              });
        });
  }

  List<Widget> _tiles() {
    List<Widget> list = [];
    list.addAll(_TeamViewTile.fromModels(tournament.state.teams));
    if (!tournament.state.started) list.add(_NewTeamTile());
    return list;
  }
}

class _TeamViewTile extends StatefulWidget {
  final TeamData model;

  _TeamViewTile({key: Key, required this.model}) : super(key: key);

  @override
  _TeamViewTileState createState() => _TeamViewTileState();

  static List<_TeamViewTile> fromModels(List<TeamData> teams) {
    return teams.map((e) => _TeamViewTile(key: UniqueKey(), model: e)).toList();
  }
}

class _TeamViewTileState extends State<_TeamViewTile> {
  bool write = false;
  TextEditingController controller = new TextEditingController();

  _TeamViewTileState();

  @override
  Widget build(BuildContext context) {
    Tournament tournament = context.read<Tournament>();

    return ListTile(
      title: write
          ? TextField(
              controller: controller,
              autofocus: true,
            )
          : Text(widget.model.name),
      trailing: !tournament.state.started
          ? Wrap(
              children: [
                IconButton(
                    icon: write ? Icon(Icons.arrow_forward) : Icon(Icons.edit),
                    onPressed: () {
                      if (write && controller.text.isNotEmpty) {
                        tournament.editTeam(widget.model.id, controller.text);
                      } else {
                        controller.text = widget.model.name;
                      }
                      setState(() {
                        write = !write;
                      });
                    }),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    tournament.removeTeam(widget.model.id);
                  },
                ),
              ],
            )
          : null,
      selected: tournament.state.winnerTeam?.id == widget.model.id,
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
    Tournament tournament = context.read<Tournament>();
    if (controller.text.isNotEmpty) {
      setState(() {
        tournament.addTeam(controller.text);
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
