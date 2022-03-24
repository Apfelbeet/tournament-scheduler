import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:tournament_scheduler_client/control/grpc/server_api.dart';
import 'package:tournament_scheduler_client/control/grpc/tournament_api.dart';
import './proto_logic_api.dart';

typedef EventHandler<T> = void Function(T event);

class GrpcAPI {
  final int port;
  final String address;

  late ClientChannel channel;

  late ServerAPI serverAPI;
  late TournamentAPI tournamentAPI;

  GrpcAPI(
      {required this.address,
      required this.port});

  Future<void> connect(EventHandler<ServerEvent> onServerEvent) async {
    channel = ClientChannel(address,
        port: port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    final serverStub = ServerAPIClient(channel,
        //options: CallOptions(timeout: Duration(seconds: 30))
    );
    final tournamentStub = TournamentAPIClient(channel,
        //options: CallOptions(timeout: Duration(seconds: 30))
    );

    serverAPI = ServerAPI(serverStub);
    tournamentAPI = TournamentAPI(tournamentStub);

    final serverEventStream = serverAPI.connect();
    listenOnStream<ServerEvent>(serverEventStream, onServerEvent);

  }

  Future<void> subscribeTournament(String key, EventHandler<TournamentEvent> onTournamentEvent) async{
    final tournamentEventStream = tournamentAPI.subscribe(key);
    listenOnStream<TournamentEvent>(tournamentEventStream, onTournamentEvent);
  }

  void unsubscribeTournament(String key) {
    tournamentAPI.unsubscribe(key);
  }

  listenOnStream<T extends GeneratedMessage>(ResponseStream<T> serverEventStream, EventHandler<T> onEvent) async{
    try {
      await for (T event in serverEventStream) {
        onEvent(event);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> disconnect() async {
    serverAPI.disconnect();
    await channel.shutdown();
  }
}
