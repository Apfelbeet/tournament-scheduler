import 'package:flutter/material.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/control/server.dart';
import 'package:tournament_scheduler_client/control/tournament.dart';
import 'package:tournament_scheduler_client/view/assets/tournament_creation.dart';
import 'package:tournament_scheduler_client/view/loading.dart';
import 'package:tournament_scheduler_client/view/server_layer.dart';
import 'package:tournament_scheduler_client/view/tournament_layer.dart';

class AppRouter {
  static const splash = "/";
  static const home = "/home";
  static const load_tournament = "/load";
  static const tournament = "/tournament";
  static const tournamentCreation = "/new";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
            builder: (context) => Setup(
                  messenger: ScaffoldMessenger.of(context),
                  navigator: Navigator.of(context),
                ),
            settings: settings);
      case load_tournament:
        return MaterialPageRoute(
            builder: (context) => TournamentLayerLoader(
                tournament: settings.arguments as Tournament,
                navigator: Navigator.of(context),
            ),
            settings: settings);

      case tournament:
        final List<Object> arguments = settings.arguments as List<Object>;
        final Tournament tournament = arguments[0] as Tournament;
        final PERMISSION permission = arguments[1] as PERMISSION;

        return MaterialPageRoute(
            builder: (context) => TournamentLayer(
                tournament: tournament, permission: permission));
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
      pushNamedAndRemoveUntil(AppRouter.home, (route) => false,
          arguments: server);

  Future<void> exitLoadingToTournament(
          Tournament tournament, PERMISSION permission) =>
      pushReplacementNamed(AppRouter.tournament,
          arguments: [tournament, permission]);

  Future<void> openHome(Server server) => pushNamed(AppRouter.splash);

  Future<void> openTournament(Tournament tournament) =>
      pushNamed(AppRouter.load_tournament, arguments: tournament);

  Future<TournamentCreate?> openTournamentCreation() =>
      pushNamed<TournamentCreate?>(AppRouter.tournamentCreation);
}
