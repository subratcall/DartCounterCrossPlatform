import 'dart:async';

import 'package:dart_client/dart_client.dart' as dartClient;
import 'package:dart_counter/model/game.dart';
import 'package:rxdart/rxdart.dart';

abstract class PlayingOnlineService {
  static PlayingOnlineService _instance = PlayingOnlineServiceImpl._();

  /// SINGLETON INSTANCE
  static PlayingOnlineService get instance {
    if (_instance == null) {
      _instance = PlayingOnlineServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE
  ValueStream<dynamic> get events; // TODO all incoming events

  Future<bool> connect();

  Future<bool> disconnect();

  void createGame();

  void joinGame(int gameCode);

  void invitePlayer(String uid);

  void reorderPlayer(int oldIndex, int newIndex);

  void removePlayer(int uid);

  void setStartingPoints(int startingPoints);

  void setMode(Mode mode);

  void setSize(int size);

  void setType(Type type);

  void startGame();

  void cancelGame();

  void performThrow(int points, int dartsThrown, int dartsOnDouble);

  void undoThrow();
}

class PlayingOnlineServiceImpl implements PlayingOnlineService {
  final dartClient.Client _client = dartClient.Client('localhost', 8888);

  PlayingOnlineServiceImpl._();

  @override
  ValueStream<dynamic> get events => ValueConnectableStream(_client.received.map((event) => throw UnimplementedError())); // TODO

  @override
  Future<bool> connect() async {
    return _client.connect();
  }

  @override
  Future<bool> disconnect() async {
    return _client.connect();
  }

  @override
  void createGame() {
    _client.createGame();
  }

  @override
  void joinGame(int gameCode) {
    _client.joinGame(gameCode);
  }

  @override
  void invitePlayer(String uid) {
    _client.invitePlayer(uid);
  }

  @override
  void reorderPlayer(int oldIndex, int newIndex) {
    _client.reorderPlayer(oldIndex, newIndex);
  }

  @override
  void removePlayer(int uid) {
    _client.removePlayer(uid);
  }

  @override
  void setStartingPoints(int startingPoints) {
    _client.setStartingPoints(startingPoints);
  }

  @override
  void setMode(Mode mode) {
    _client.setMode(mode == Mode.firstTo ? dartClient.Mode.firstTo : dartClient.Mode.bestOf);
  }

  @override
  void setSize(int size) {
    _client.setSize(size);
  }

  @override
  void setType(Type type) {
    _client.setType(type == Type.legs ? dartClient.Type.legs : dartClient.Type.sets);
  }

  @override
  void startGame() {
    _client.startGame();
  }

  @override
  void cancelGame() {
    _client.cancelGame();
  }

  @override
  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _client.performThrow(points, dartsThrown, dartsOnDouble);
  }

  @override
  void undoThrow() {
    _client.undoThrow();
  }
}
