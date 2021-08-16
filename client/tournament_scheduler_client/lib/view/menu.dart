import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:flutter/material.dart';

abstract class Dialog {

  Widget build(BuildContext context);

  void show(BuildContext context) {
    showDialog(context: context, builder:  build);
  }
}

class UrlDialog extends Dialog{

  ///textController stores the text typed by the user.
  ///The text will be stored permanently and used as URL.
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text("Add new Server:"),
      content: TextField(
        decoration: const InputDecoration(hintText: "enter url/ip"),
        controller: textController,
        onSubmitted: (value) => _submit(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => _submit(context),
        ),
      ],
    );
  }

  void _submit(BuildContext context) {
    Navigator.pop(context);
    Storage.instance().storeNewUrl(textController.text);
  }
}

class TournamentCreationDialog extends Dialog {

  ///textController stores the text typed by the user.
  final TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
      title: Text("New Tournament"),
      content: TextField(
        decoration: InputDecoration(hintText: "name"),
        controller: textController,
        onSubmitted: (value) => _submit(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => _submit(context),
        ),
      ],
    );
  }

  void _submit(context) {
    Navigator.pop(context);
    Storage.instance().createTournament(textController.text);
  }

}

class WinDialog extends Dialog {

  @override
  Widget build(BuildContext context) {
    final st = Storage.instance();
    final String? name = st.getWinnerModel()?.name;
    return AlertDialog(
      title: Text(name == null ? "" : (name + " wins!")),
    );
  }
}

