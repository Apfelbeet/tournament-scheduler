import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tournament_scheduler_client/control/model.dart';
import 'package:tournament_scheduler_client/control/storage.dart';

class StatsView extends StatelessWidget {
  final List<StatsModel> stats;
  final String label;

  StatsView(this.stats, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
            child: Center(
                child:
                    Text(label, style: Theme.of(context).textTheme.headline5)),
          ),
          Divider(thickness: 2,),
          DataTable(
            columnSpacing: 25,
            columns: [
              DataColumn(label: Text("")),
              DataColumn(label: Text("P"), numeric: true),
              DataColumn(label: Text("W"), numeric: true),
              DataColumn(label: Text("L"), numeric: true),
              DataColumn(label: Text("D"), numeric: true),
              DataColumn(label: Text("+"), numeric: true),
              DataColumn(label: Text("-"), numeric: true)
            ],
            rows: stats
                .map<DataRow>((st) => generateRow(st, context))
                .toList(growable: true),
          ),
        ],
      ),
    );
  }
}

DataRow generateRow(StatsModel st, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Text(
          Storage.instance().getTeam(st.team)?.name ?? "",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      tile(st.points.toString()),
      tile(st.wins.toString()),
      tile(st.loses.toString()),
      tile(st.draws.toString()),
      tile(st.scored.toString()),
      tile(st.conceded.toString()),
    ],
  );
}

DataCell tile(String text) {
  return DataCell(Text(
    text,
    textAlign: TextAlign.center,
  ));
}
