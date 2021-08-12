import 'dart:async';

import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:web_socket_channel/io.dart';

class SocketConnection {
  final String url;
  IOWebSocketChannel? channel;
  final _onData;
  final _onError;
  final _onDone;
  bool connected = false;

  SocketConnection(this.url, this._onData, this._onError, this._onDone);

  void connect() {

    channel = IOWebSocketChannel.connect("ws://$url", protocols: ["echo-protocol"]);

    channel!.stream.listen(_onData, onError: _onError, onDone: _onDone, cancelOnError: true);

  }

  void send(String message) {
    channel?.sink.add(message);
  }

  void disconnect() {
    channel?.sink.close();
  }
}
