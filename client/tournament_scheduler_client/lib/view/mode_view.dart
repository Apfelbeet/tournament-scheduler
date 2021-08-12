import 'package:tournament_scheduler_client/control/model.dart';
import 'package:tournament_scheduler_client/control/notifier.dart';
import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<ModeNotifier> (
      builder: (context, n, c) => ListView(
        children: _ModeViewTile.fromModels(Storage.instance().getModes()),
      ),
    );
  }
}

class _ModeViewTile extends StatelessWidget {
  final ModeModel model;

  _ModeViewTile(this.model);

  @override
  Widget build(BuildContext context) {
    final Storage st = Storage.instance();

    return ListTile(
      enabled: !(st.isStarted() ?? true),
      title: Text(this.model.title),
      subtitle: Text(this.model.description),
      onTap: () {
        st.setActiveMode(model.id);
      },
      selected: st.getActiveMode() != null && st.getActiveMode()!.id == model.id,
    );
  }

  static List<_ModeViewTile> fromModels(List<ModeModel> modes) {
    return modes.map((e) => _ModeViewTile(e)).toList();
  }
}
