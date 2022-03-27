import 'package:tournament_scheduler_client/cross_platform/url_strategy.dart';
import 'package:tournament_scheduler_client/navigation/app_router.dart';
import 'package:tournament_scheduler_client/view/theme.dart';
import 'package:flutter/material.dart';


void main() {
  usePathUrlStrategy();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tournament Scheduler',
      themeMode: ThemeMode.system,
      theme: basicTheme,
      darkTheme: darkTheme,

      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
      initialRoute: AppRouter.splash,
    );
  }
}
