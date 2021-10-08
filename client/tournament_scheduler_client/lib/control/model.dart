import 'package:tournament_scheduler_client/control/storage.dart';

///
/// TeamModel
///
class TeamModel {
  String name;
  int id;

  TeamModel(this.id, this.name);

  TeamModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}

///
/// ModuleModel
///
class ModuleModel {
  final List<int> modules;
  final String type;
  final String label;
  final List<StatsModel>? stats;
  final bool visible;

  ModuleModel(this.type, this.label, this.modules, this.visible, this.stats);

  ModuleModel.fromJson(Map<String, dynamic> json)
      : this(
            json["type"],
            json["label"],
            [...json["modules"], ...json["games"]],
            json["visible"],
            json.containsKey("stats")
                ? (json["stats"] as List)
                    .map<StatsModel>(
                        (st) => StatsModel.fromJson(st as Map<String, dynamic>))
                    .toList(growable: false)
                : null);
}

class StatsModel {
  final int team, wins, loses, scored, conceded;

  StatsModel(this.team, this.wins, this.loses, this.scored, this.conceded);

  StatsModel.fromJson(Map<String, dynamic> json)
      : this(json['team'], json['wins'], json['loses'], json['scored'],
            json['conceded']);
}

///
/// GameModel
///
class GameModel {
  final String teamA, teamB;
  final int? resultA, resultB;
  final int id;

  GameModel(this.id, this.teamA, this.teamB,
      {required this.resultA, required this.resultB});

  GameModel.fromJson(Map<String, dynamic> json)
      : this(
            json['id'],
            Storage.instance().getTeam(json['down'][0])?.name ?? "-",
            Storage.instance().getTeam(json['down'][1])?.name ?? "-",
            resultA: json.containsKey('data') && json['data'].containsKey('result') ? json['data']['result']['a'] : null,
            resultB: json.containsKey('data') && json['data'].containsKey('result') ? json['data']['result']['b'] : null);
}

///
/// ModeModel
///
class ModeModel {
  final int id;
  final String title, description;

  ModeModel(this.id, this.title, this.description);

  ModeModel.fromJson(Map<String, dynamic> json)
      : this(json['id'], json['title'], json['description']);
}
