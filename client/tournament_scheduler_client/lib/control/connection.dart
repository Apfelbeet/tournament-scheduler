import 'package:web_socket_channel/web_socket_channel.dart';

class SocketConnection {
  final String url;
  WebSocketChannel? channel;
  final _onData;
  final _onError;
  final _onDone;
  bool connected = false;

  SocketConnection(this.url, this._onData, this._onError, this._onDone);

  void connect() {

    channel = WebSocketChannel.connect(Uri.parse("ws://$url"), protocols: ["echo-protocol"]);

    channel!.stream.listen(_onData, onError: _onError, onDone: _onDone, cancelOnError: true);

  }

  Future<dynamic> send(String message) async {
    channel?.sink.add(message);
  }

  void disconnect() {
    channel?.sink.close();
  }

}
