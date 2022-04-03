import 'package:grpc/grpc.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';

class ServerAPI {
  final ServerAPIClient serverStub;

  ServerAPI(this.serverStub);

  Future<List<Mode>> getModes() async {
    final res = await serverStub.getModes(Empty());
    return res.modes;
  }

  Future<List<String>> getTournaments() async {
    final res = await serverStub.getTournaments(Empty());
    return res.keys;
  }

  Future<TournamentCreateAcknowledgment> createTournament(String name) async {
    final res = await serverStub.createTournament(TournamentCreate(key: name));
    return res;
  }

  Future<Acknowledgment> removeTournament(TournamentAccess access) async {
    final res = await serverStub.removeTournament(access);
    return res;
  }

  ResponseStream<ServerEvent> connect() {
    final res = serverStub.connect(Empty());
    return res;
  }

  Future<Acknowledgment> disconnect() async {
    final res = await serverStub.disconnect(Empty());
    return res;
  }
}