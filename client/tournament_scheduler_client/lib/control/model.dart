class GameModel {
  final String teamA, teamB;
  final int? resultA, resultB;
  final int id;

  GameModel(this.id, this.teamA, this.teamB,
      {required this.resultA, required this.resultB});
}
