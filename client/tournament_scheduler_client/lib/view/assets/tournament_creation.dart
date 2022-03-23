import 'package:flutter/material.dart';
import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';
import 'package:tournament_scheduler_client/navigation/snackbar.dart';

class TournamentCreation extends StatefulWidget {
  const TournamentCreation({Key? key}) : super(key: key);

  @override
  State<TournamentCreation> createState() => _TournamentCreationState();
}

class _TournamentCreationState extends State<TournamentCreation> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Tournament")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                  decoration: const InputDecoration(hintText: "Name"),
                  controller: nameController,
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () => _submit(context),
      ),
    );
  }

  void _submit(BuildContext context) {
    if(nameController.text.length > 0) {
      Navigator.of(context).pop(TournamentCreate(key: nameController.text));
    } else {
      ScaffoldMessenger.of(context).showError("Missing Arguments!");
    }
  }
}
