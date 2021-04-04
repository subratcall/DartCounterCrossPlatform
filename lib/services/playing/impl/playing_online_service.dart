import 'dart:async';

import 'package:dart_client/dart_client.dart' as dartClient;
import 'package:dart_counter/model/game.dart';

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
  PlayingOnlineService._();

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

  Future<bool> connect() async {
    return _client.connect();
  }

  Future<bool> disconnect() async {
    return _client.connect();
  }

  void createGame() {
    _client.createGame();
  }

  void joinGame(int gameCode) {
    _client.joinGame(gameCode);
  }

  void invitePlayer(String uid) {
    _client.invitePlayer(uid);
  }

  void reorderPlayer(int oldIndex, int newIndex) {
    _client.reorderPlayer(oldIndex, newIndex);
  }

  void removePlayer(int uid) {
    _client.removePlayer(uid);
  }

  void setStartingPoints(int startingPoints) {
    _client.setStartingPoints(startingPoints);
  }

  void setMode(Mode mode) {
    _client.setMode(mode == Mode.firstTo
        ? dartClient.Mode.firstTo
        : dartClient.Mode.bestOf);
  }

  void setSize(int size) {
    _client.setSize(size);
  }

  void setType(Type type) {
    _client.setType(
        type == Type.legs ? dartClient.Type.legs : dartClient.Type.sets);
  }

  void startGame() {
    _client.startGame();
  }

  void cancelGame() {
    _client.cancelGame();
  }

  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _client.performThrow(points, dartsThrown, dartsOnDouble);
  }

  void undoThrow() {
    _client.undoThrow();
  }
}
