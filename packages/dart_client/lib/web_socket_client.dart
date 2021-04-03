import 'dart:io';

class WebSocketClient {

  final String _host;
  final int _port;

  WebSocket _webSocket;

  WebSocketClient(this._host, this._port);

  Stream<String> get received => _webSocket.map((message) => message as String);

  Future<bool> connect() async {
    bool connected = false;
    try {
      _webSocket = await WebSocket.connect('ws://$_host:$_port/');
      _webSocket.pingInterval = Duration(seconds: 5);
      connected = true;
      print('Connected to -- ws://$_host:$_port/');
    } catch (e) {
      print('Connection failed! -- ws://$_host:$_port/ not reachable');
    }
    return connected;
  }

  Future<bool> disconnect() async {
    await _webSocket.close();
    _webSocket = null;
    print('Disconnected from -- ws://$_host:$_port/');
    return true;
  }

  void send(String json) {
    if(_webSocket != null) {
      _webSocket.add(json);
    } else {
      print("Couldn't send message! -- Not connected to a Server");
    }
  }

}