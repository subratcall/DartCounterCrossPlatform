part of dart_client;

abstract class AbstractClient {
  /// INTERFACE
  Stream<ResponsePacket> get received;

  Future<bool> connect();

  Future<bool> disconnect();

  void createGame();

  void joinGame(int gameCode);

  void invitePlayer(String uid);

  void reorderPlayer(int oldIndex, int newIndex);

  void removePlayer(int id);

  void setStartingPoints(int startingPoints);

  void setMode(Mode mode);

  void setSize(int size);

  void setType(Type type);

  void startGame();

  void cancelGame();

  void performThrow(int points, int dartsThrown, int dartsOnDouble);

  void undoThrow();
}

class Client implements AbstractClient {
  final WebSocketClient _webSocketClient;

  Client(String host, int port)
      : this._webSocketClient = WebSocketClient(host, port);

  @override
  Stream<ResponsePacket> get received =>
      _webSocketClient.received.map((json) => JsonDecoder.decode(json));

  @override
  Future<bool> connect() async {
    return _webSocketClient.connect();
  }

  @override
  Future<bool> disconnect() async {
    return _webSocketClient.disconnect();
  }

  @override
  void createGame() {
    _sendPacket(CreateGamePacket());
  }

  @override
  void joinGame(int gameCode) {
    _sendPacket(JoinGamePacket(gameCode));
  }

  @override
  void invitePlayer(String uid) {
    _sendPacket(InvitePlayerPacket(uid));
  }

  @override
  void reorderPlayer(int oldIndex, int newIndex) {
    _sendPacket(ReorderPlayerPacket(oldIndex, newIndex));
  }

  @override
  void removePlayer(int id) {
    _sendPacket(RemovePlayerPacket(id));
  }

  @override
  void setStartingPoints(int startingPoints) {
    _sendPacket(SetStartingPointsPacket(startingPoints));
  }

  @override
  void setMode(Mode mode) {
    _sendPacket(SetModePacket(mode));
  }

  @override
  void setSize(int size) {
    _sendPacket(SetSizePacket(size));
  }

  @override
  void setType(Type type) {
    _sendPacket(SetTypePacket(type));
  }

  @override
  void startGame() {
    _sendPacket(StartGamePacket());
  }

  @override
  void cancelGame() {
    _sendPacket(CancelGamePacket());
  }

  @override
  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _sendPacket(PerformThrowPacket(points, dartsThrown, dartsOnDouble));
  }

  @override
  void undoThrow() {
    _sendPacket(UndoThrowPacket());
  }

  void _sendPacket(RequestPacket packet) {
    _webSocketClient.send(JsonEncoder.encode(packet));
  }
}
