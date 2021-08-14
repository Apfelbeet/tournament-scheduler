import 'package:tournament_scheduler_client/control/notifier.dart';
import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorMessageWidget extends StatelessWidget {
  static int currentLayer = 0;

  final Widget child;
  final int layer;

  ErrorMessageWidget({required this.child, required this.layer});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
      value: Storage.instance().errorNotifier,
      child: Consumer<ErrorNotifier>(builder: (context, value, c) {
        WidgetsBinding.instance?.addPostFrameCallback((_) => _action(context));
        return child;
      }));

  void _action(BuildContext context) {
    if (Storage.instance().errorMessage != null && layer == currentLayer) {
      ScaffoldMessenger.of(context).showSnackBar(
          new SnackBar(content: Text(Storage.instance().errorMessage!),
          ));
      Storage.instance().errorMessage = null;
    }
  }
}
