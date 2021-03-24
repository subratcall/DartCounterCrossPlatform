import 'dart:async';

import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/playing/service.dart';
import 'package:dart_game/dart_game.dart' as DartGame;

class PlayingOfflineService extends AbstractPlayingService {
  static final PlayingOfflineService instance = PlayingOfflineService._();

  PlayingOfflineService._();

  StreamController<Event> controller = StreamController<Event>.broadcast();

  DartGame.Game _game;

  @override
  Stream<Event> onEvent() => controller.stream;

  void createGame() {
    _game = DartGame.Game();
    _addSnapshotEvent();
  }

  void addDartBot() {
    _game.addDartBot();
    _addSnapshotEvent();
  }

  void removeDartBot() {
    _game.removeDartBot();
    _addSnapshotEvent();
  }

  void setDartBotTargetAverage(int targetAverage) {
    _game.setDartBotTargetAverage(targetAverage);
  }

  void addPlayer() {
    _game.addPlayer();
    _addSnapshotEvent();
  }

  void removePlayer(int id) {
    _game.removePlayer(id);
    _addSnapshotEvent();
  }

  void setStartingPoints(int startingPoints) {
    _game.config.startingPoints = startingPoints;
  }

  void setMode(Mode mode) {
    _game.config.mode = mode == Mode.firstTo ? DartGame.Mode.firstTo : DartGame.Mode.bestOf;
  }

  void setSize(int size) {
    _game.config.size = size;
  }

  void setType(Type type) {
    _game.config.type = type == Type.legs ? DartGame.Type.legs : DartGame.Type.sets;
  }

  void startGame() {
    _game.start();
    _addSnapshotEvent();
  }

  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _game.performThrow(DartGame.Throw(points, dartsThrown: dartsThrown, dartsOnDouble: dartsOnDouble));
    _addSnapshotEvent();
  }

  void undoThrow() {
    _game.undoThrow();
    _addSnapshotEvent();
  }
  
  void _addSnapshotEvent() {
    controller.add(SnapshotEvent(Game()));
  }

  void dispose() {
    controller.close();
  }
}
