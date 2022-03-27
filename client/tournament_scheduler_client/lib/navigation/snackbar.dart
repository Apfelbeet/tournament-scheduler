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
      duration: Duration(seconds: 1),
      content: Row(
        children: [
          Expanded(child: Text("")),
          Icon(Icons.check_circle, color: Colors.green,),
        ],
      ),
      backgroundColor: Colors.black.withOpacity(1),
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
