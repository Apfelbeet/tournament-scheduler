import 'package:flutter/material.dart';
import 'package:tournament_scheduler_client/control/server.dart';
import 'package:tournament_scheduler_client/control/perferences.dart';
import 'package:tournament_scheduler_client/view/loadingscreen.dart';
import 'package:tournament_scheduler_client/navigation/app_router.dart';

typedef OnLoad = void Function();

class Setup extends StatelessWidget {

  final NavigatorState navigator;
  final ScaffoldMessengerState messenger;

  Setup({required this.navigator, required this.messenger}) {
    _load();
  }

  Future<void> _load() async {
    await Preferences.preload();

    Server server = new Server(url: Preferences.getUrl(), port: Preferences.getPort(), messenger: messenger);
    await server.connect();

    navigator.exitSplashScreenToHome(server);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen.app();
  }
}