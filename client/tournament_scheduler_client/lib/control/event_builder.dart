import 'dart:async';

import 'package:flutter/cupertino.dart';

class EventChannel {
  late StreamController<Null> _streamController;

  Stream<Null> get stream => _streamController.stream;

  EventChannel() {
    _streamController = StreamController<Null>.broadcast();
  }

  void raise() {
    _streamController.add(null);
  }

  void close() {
    _streamController.close();
  }
}

typedef Builder = Widget Function(BuildContext);

class EventBuilder extends StatelessWidget {
  final EventChannel channel;
  final Builder builder;

  EventBuilder({required this.channel, required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Null>(
      stream: channel.stream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<Null> snapshot) {
        return builder(context);
      }
    );
  }
}
