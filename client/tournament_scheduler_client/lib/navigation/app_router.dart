import 'package:flutter/material.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/control/server.dart';
import 'package:tournament_scheduler_client/control/tournament.dart';
import 'package:tournament_scheduler_client/view/assets/tournament_creation.dart';
import 'package:tournament_scheduler_client/view/loading.dart';
import 'package:tournament_scheduler_client/view/server_layer.dart';
import 'package:tournament_scheduler_client/view/tournament_layer.dart';

class AppRouter {
  //static const splashScreen = "/";
  //static const serverSelection = "/";
  static const splash = "/";
  static const home = "/home";
  static const tournament = "/t";
  static const tournamentCreation = "/new";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
            builder: (context) => Setup(messenger: ScaffoldMessenger.of(context), navigator: Navigator.of(context),),
            settings: settings);
      case tournament:
        return MaterialPageRoute(
            builder: (context) =>
                TournamentLayer(tournament: settings.arguments as Tournament),
            settings: settings);
      case tournamentCreation:
        return MaterialPageRoute<TournamentCreate?>(
            builder: (context) => TournamentCreation(), settings: settings);
      case home:
        return MaterialPageRoute(
            builder: (context) =>
                ServerLayer(server: settings.arguments as Server));
    }
    return null;
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(child: Text("Route not found.")),
            ));
  }
}

extension NavigatorStateExtensions on NavigatorState {

  Future<void> exitSplashScreenToHome(Server server) =>
      pushNamedAndRemoveUntil(AppRouter.home, (route) => false, arguments: server);

  Future<void> openHome(Server server) => pushNamed(AppRouter.splash);

  Future<void> openTournament(Tournament tournament) =>
      pushNamed(AppRouter.tournament, arguments: tournament);

  Future<TournamentCreate?> openTournamentCreation() =>
      pushNamed<TournamentCreate?>(AppRouter.tournamentCreation);
}
