import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tournament_scheduler_client/view/assets/logo.dart';

class LoadingScreen extends StatelessWidget {
  final Widget logo;
  final Widget? action;

  const LoadingScreen({Key? key, required this.logo, this.action}) : super(key: key);

  LoadingScreen.app({this.action}) : logo = SvgPicture.asset(APP_LOGO_PATH);

  @override
  Widget build(BuildContext context) {
    final _action = action;

    return Scaffold(
      appBar: AppBar(
        actions: [if(_action != null) _action],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: logo,
      )
    );
  }
}

class TestLoading extends StatelessWidget {

  const TestLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(logo: SvgPicture.asset(
        APP_LOGO_PATH,

    ), action: IconButton(icon: Icon(Icons.settings), onPressed: () => {}));
  }
}
