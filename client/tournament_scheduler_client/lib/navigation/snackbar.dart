import 'package:flutter/material.dart';

extension ScaffoldMessengerStateExtension on ScaffoldMessengerState {
  void showError(String msg) {
    showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.redAccent,
    ));
  }

  void showOk() {
    showSnackBar(SnackBar(
      content: Text("OK!"),
      backgroundColor: Colors.greenAccent,
    ));
  }

  void showLoading() {
    showSnackBar(
      SnackBar(
        content: Row(
          children: [CircularProgressIndicator(), Text("Reloading ...")],
        ),
      ),
    );
  }
}
