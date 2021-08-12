import 'package:tournament_scheduler_client/control/model.dart';
import 'package:tournament_scheduler_client/control/notifier.dart';
import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class GameView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {

    return Consumer<GameNotifier> (
      builder: (context, n, c) =>
          ListView(
        children: _ModuleListTile.fromModels(Storage.instance().getModules()),
      ),
    );
  }
}

class _ModuleListTile extends StatelessWidget {
  final ModuleModel model;
  final List<_GameListTile> games;

  _ModuleListTile(this.model, this.games);

  _ModuleListTile.fromModel(ModuleModel model)
      : this(model, _GameListTile.fromModels(model.games));

  static List<_ModuleListTile> fromModels(List<ModuleModel> models) =>
      models.map((e) => new _ModuleListTile.fromModel(e)).toList();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.label),
      subtitle: Column(
        children: games,
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
                  setState(() {
                    _expanded = false;
                    Storage.instance().setResult(
                        widget.model.id,
                        int.parse(_controllerA.text.isEmpty
                            ? "0"
                            : _controllerA.text),
                        int.parse(_controllerB.text.isEmpty
                            ? "0"
                            : _controllerB.text));
                  });
                },
              )
            ],
          )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: components(context),
      ),
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
