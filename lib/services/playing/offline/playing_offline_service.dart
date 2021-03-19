import 'dart:async';

import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/services/playing/service.dart';
import 'package:dart_game/dart_game.dart';


class PlayingOfflineService extends AbstractPlayingService {
  static final PlayingOfflineService instance = PlayingOfflineService._();

  PlayingOfflineService._();

  StreamController<Event> controller = StreamController<Event>.broadcast();

  Game _game;

  @override
  Stream<Event> onEvent() => controller.stream;

  void createGame() {
    _game = Game();
    controller.add(SnapshotEvent(GameSnapshot.from(_game)));
  }

  void addDartBot() {
    _game.addDartBot();
    controller.add(SnapshotEvent(GameSnapshot.from(_game)));
  }

  void removeDartBot() {
    _game.removeDartBot();
    controller.add(SnapshotEvent(GameSnapshot.from(_game)));
  }

  void setDartBotAverage(int average) {
    (_game.players[_game.dartBotIndex] as DartBot).targetAverage = average;
  }

  void addPlayer() {
    _game.addPlayer(Player());
    controller.add(SnapshotEvent(GameSnapshot.from(_game)));
  }

  void removePlayer(String id) {
    int index = _game.players.indexWhere((player) => player.id == id);
    _game.removePlayer(index);
    controller.add(SnapshotEvent(GameSnapshot.from(_game)));
  }

  void setStartingPoints(int startingPoints) {
    _game.config.startingPoints = startingPoints;
  }

  void setMode(Mode mode) {
    _game.config.mode = mode;
  }

  void setSize(int size) {
    _game.config.size = size;

  }

  void setType(Type type) {
    _game.config.type = type;
  }

  void startGame() {
    _game.start();
    controller.add(SnapshotEvent(GameSnapshot.from(_game)));
  }

  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _game.performThrow(Throw(points, dartsOnDouble, dartsThrown));
    controller.add(SnapshotEvent(GameSnapshot.from(_game)));
  }

  void undoThrow() {
    _game.undoThrow();
    controller.add(SnapshotEvent(GameSnapshot.from(_game)));
  }

  void dispose() {
    controller.close();
  }
}
