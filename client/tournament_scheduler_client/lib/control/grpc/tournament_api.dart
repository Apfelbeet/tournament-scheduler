import 'package:grpc/grpc.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/util/Pair.dart';

class TournamentAPI {
  final TournamentAPIClient tournamentStub;

  TournamentAPI(this.tournamentStub);

  Future<Acknowledgment> addTeam(TournamentAccess access, String name) async {
    final ack =
        await tournamentStub.addTeam(TeamAdd(access: access, name: name));

    return ack;
  }

  Future<Acknowledgment> editTeam(
      TournamentAccess access, int id, String name) async {
    final ack = await tournamentStub.editTeam(TeamEdit(
      access: access,
      name: name,
      id: id,
    ));

    return ack;
  }

  Future<Acknowledgment> removeTeam(TournamentAccess access, int id) async {
    final ack = await tournamentStub.removeTeam(TeamRemove(
      access: access,
      id: id,
    ));
    return ack;
  }

  Future<Acknowledgment> setMode(TournamentAccess access, int id) async {
    final ack = await tournamentStub.setMode(SetMode(
      access: access,
      id: id,
    ));
    return ack;
  }

  Future<Acknowledgment> setResult(
      TournamentAccess access, int id, int scoreA, int scoreB) async {
    final ack = await tournamentStub.setResult(SetResult(
        access: access,
        game: GameData(
          id: id,
          scoreA: scoreA,
          scoreB: scoreB,
        )));

    return ack;
  }

  Future<Acknowledgment> start(TournamentAccess access) async {
    final ack = await tournamentStub.start(access);
    return ack;
  }

  Future<Acknowledgment> reset(TournamentAccess access) =>
      tournamentStub.reset(access);

  ResponseStream<TournamentEvent> subscribe(String key) {
    final res = tournamentStub.subscribe(TournamentAccess(key: key));
    return res;
  }

  Future<Acknowledgment> unsubscribe(String key) async {
    final ack = await tournamentStub.unsubscribe(TournamentAccess(key: key));
    return ack;
  }

  Future<ResponseTournamentData> load(TournamentAccess access) async {
    final res = await tournamentStub.load(access);
    return res;
  }

  Future<PERMISSION> getPermissionOfKey(
      TournamentAccess access, String permissionKey) async {
    final res = await tournamentStub.getPermissionOfKey(PermissionQuery(
      access: access,
      permissionKey: permissionKey,
    ));
    return res.permission;
  }

  Future<PERMISSION> getPermission(TournamentAccess access) async {
    final res = await tournamentStub.getPermission(access);
    return res.permission;
  }

  Future<List<Pair<String, PERMISSION>>> getPermissionManagement(
      TournamentAccess access) async {
    final res = await tournamentStub.getPermissionManagement(access);
    return res.pairs
        .map((e) => Pair(e.key, e.permission))
        .toList(growable: false);
  }

  Future<Acknowledgment> setPermission(TournamentAccess access,
      String permissionKey, PERMISSION permission) async {
    final res = await tournamentStub.setPermission(SetPermission(
        access: access, permissionKey: permissionKey, permission: permission));
    return res;
  }

  Future<Acknowledgment> removePermissionKey(
      TournamentAccess access, String permissionKey) async {
    final res = await tournamentStub.removePermissionKey(
        RemovePermissionKey(access: access, permissionKey: permissionKey));
    return res;
  }
}
