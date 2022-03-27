import 'package:grpc/grpc.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';

class TournamentAPI {
  final TournamentAPIClient tournamentStub;

  TournamentAPI(this.tournamentStub);

  Future<Acknowledgment> addTeam(String key, String sync, String name) async {
    final ack = await tournamentStub.addTeam(
        TeamAdd(access: TournamentAccess(key: key, sync: sync), name: name));

    return ack;
  }

  Future<Acknowledgment> editTeam(
      String key, String sync, int id, String name) async {
    final ack = await tournamentStub.editTeam(TeamEdit(
      access: TournamentAccess(key: key, sync: sync),
      name: name,
      id: id,
    ));

    return ack;
  }

  Future<Acknowledgment> removeTeam(String key, String sync, int id) async {
    final ack = await tournamentStub.removeTeam(TeamRemove(
      access: TournamentAccess(key: key, sync: sync),
      id: id,
    ));
    return ack;
  }

  Future<Acknowledgment> setMode(String key, String sync, int id) async {
    final ack = await tournamentStub.setMode(SetMode(
      access: TournamentAccess(key: key, sync: sync),
      id: id,
    ));
    return ack;
  }

  Future<Acknowledgment> setResult(
      String key, String sync, int id, int scoreA, int scoreB) async {
    final ack = await tournamentStub.setResult(SetResult(
        access: TournamentAccess(sync: sync, key: key),
        game: GameData(
          id: id,
          scoreA: scoreA,
          scoreB: scoreB,
        )));

    return ack;
  }

  Future<Acknowledgment> start(String key, String sync) async {
    final ack =
        await tournamentStub.start(TournamentAccess(key: key, sync: sync));
    return ack;
  }

  Future<Acknowledgment> reset(String key, String sync) async {
    final ack =
        await tournamentStub.reset(TournamentAccess(key: key, sync: sync));
    return ack;
  }

  ResponseStream<TournamentEvent> subscribe(String key) {
    final res = tournamentStub.subscribe(TournamentAccess(key: key));
    return res;
  }

  Future<Acknowledgment> unsubscribe(String key) async {
    final ack = await tournamentStub.unsubscribe(TournamentAccess(key: key));
    return ack;
  }

  Future<ResponseTournamentData> load(String key) async {
    final res = await tournamentStub.load(TournamentAccess(key: key));
    return res;
  }
}
