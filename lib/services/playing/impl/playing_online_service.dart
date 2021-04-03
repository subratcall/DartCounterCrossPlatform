import 'dart:async';

import 'package:dart_client/dart_client.dart';
import 'package:dart_counter/model/game.dart';

abstract class PlayingOnlineService {

  static PlayingOnlineService _instance = PlayingOnlineServiceImpl._();

  /// SINGLETON INSTANCE
  static PlayingOnlineService get instance {
    if(_instance == null) {
      _instance = PlayingOnlineServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE
  PlayingOnlineService._();

  Future<bool> connect();

  Future<bool> disconnect();

  void createGame();

  void changeGameConfig();

  void joinGame(String gameId);

  void setMode(Mode mode);

  void setSize(int size);

  void setType(Type type);

  void setStartingPoints(int startingPoints);

  bool addPlayer();

  void removePlayer(int index);

  void startGame();

  void performThrow(int points, int dartsThrown, int dartsOnDouble);

  void undoThrow();

}

class PlayingOnlineServiceImpl implements PlayingOnlineService {

  final Client _client = Client('localhost', 8888);

  PlayingOnlineServiceImpl._();

  Future<bool> connect() {

  }

  Future<bool> disconnect() {

  }

  void createGame() {

  }

  void changeGameConfig() {

  }

  void joinGame(String gameId) {

  }

  void setMode(Mode mode) {

  }

  void setSize(int size) {

  }

  void setType(Type type) {

  }

  void setStartingPoints(int startingPoints) {

  }

  bool addPlayer() {

  }

  void removePlayer(int index) {

  }

  void startGame() {

  }

  void performThrow(int points, int dartsThrown, int dartsOnDouble) {

  }

  void undoThrow() {

  }

}
