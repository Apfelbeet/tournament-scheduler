import 'package:provider/provider.dart';
import 'package:tournament_scheduler_client/control/event_builder.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/control/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tournament_scheduler_client/control/tournament.dart';
import 'package:tournament_scheduler_client/view/stats_view.dart';

import '../control/tournament_state.dart';

class GameView extends StatelessWidget {
  final Tournament tournament;

  GameView(this.tournament);

  @override
  Widget build(BuildContext context) {
    return EventBuilder(
        channel: tournament.gameEvents,
        builder: (context) {
          final map = tournament.state.structure?.moduleToGames;
          return Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: ListView(
                children: map != null
                    ? ModuleListTile.fromModels(
                        map, tournament.state.structure!, tournament)
                    : [],
              ));
        });
  }
}

class ModuleListTile extends StatelessWidget {
  final StructureData model;
  final List<_GameListTile> games;
  final Tournament tournament;

  ModuleListTile(this.model, this.games, this.tournament);

  ModuleListTile.fromModel(
      StructureData model, List<GameModel> games, Tournament tournament)
      : this(model, _GameListTile.fromModels(games), tournament);

  static List<ModuleListTile> fromModels(Map<int, List<int>> models,
          StructureState state, Tournament tournament) =>
      models.entries
          .map((entry) {
            final module = state.getModule(entry.key);
            final games = entry.value
                .map((id) => state.getGame(id))
                .whereType<GameModel>()
                .toList();
            return module != null
                ? ModuleListTile.fromModel(module, games, tournament)
                : null;
          })
          .whereType<ModuleListTile>()
          .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Card(
        child: InkWell(
          onTap: () {
            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return StatsView(model.stats, model.label, tournament);
                });
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Row(
                    children: [
                      Expanded(child: Text("")),
                      Align(
                        alignment: Alignment.center,
                        child: Text(model.label,
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Expanded(child: Align(child: Icon(Icons.bar_chart), alignment: Alignment.centerRight,)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                ...games
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GameListTileState extends State<_GameListTile> {
  bool _expanded = false;

  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();

  _GameListTileState(GameModel model) {
    if (model.resultA != null)
      _controllerA = TextEditingController(text: model.resultA.toString());
    if (model.resultB != null)
      _controllerB = TextEditingController(text: model.resultB.toString());
  }

  List<Widget> components(BuildContext context) {
    Tournament tournament = context.read<Tournament>();

    var list = <Widget>[
      ListTile(
          title: Text("${widget.model.teamA} : ${widget.model.teamB}"),
          subtitle: Text(resultText(widget.model)),
          onTap: () => setState(() {
                _expanded = !_expanded;
              })),
    ];
    if (_expanded) {
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: widget.model.teamA),
                  textAlign: TextAlign.center,
                  controller: _controllerA,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 20,
                child: Text(":", textAlign: TextAlign.center),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: widget.model.teamB),
                  textAlign: TextAlign.center,
                  controller: _controllerB,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  final int scoreA = int.parse(
                      _controllerA.text.isEmpty ? "0" : _controllerA.text);
                  final int scoreB = int.parse(
                      _controllerB.text.isEmpty ? "0" : _controllerB.text);

                  tournament.setResult(tournament.key,
                      tournament.state.sync, widget.model.id, scoreA, scoreB);
                  setState(() {
                    _expanded = false;
                  });
                },
              )
            ],
          )));
    }

    list.add(Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Divider(
        thickness: 1,
      ),
    ));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: components(context),
    );
  }

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    super.dispose();
  }

//Provider.of<TournamentModel>(context)
// .setResult(widget.model.id, 10, 5),
}

class _GameListTile extends StatefulWidget {
  final GameModel model;

  _GameListTile(this.model);

  @override
  State<StatefulWidget> createState() => _GameListTileState(model);

  static List<_GameListTile> fromModels(List<GameModel> models) =>
      models.map((e) => new _GameListTile(e)).toList();
}

String resultText(GameModel model) {
  if (model.resultA == null || model.resultB == null) {
    return "no score yet";
  } else {
    return "${model.resultA} : ${model.resultB}";
  }
}
