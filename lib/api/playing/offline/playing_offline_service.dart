import 'package:dart_counter/api/playing/offline/model/dartbot.dart';
import 'package:dart_counter/api/playing/offline/model/game.dart';
import 'package:dart_counter/api/playing/offline/model/type.dart';

import 'model/mode.dart';
import 'model/player.dart';
import 'model/throw.dart';

class PlayingOfflineService {
  static final PlayingOfflineService instance = PlayingOfflineService._();

  PlayingOfflineService._();

  Game game;

  void createGame() {
    game = Game();
  }

  void addDartBot() {
    game.addDartBot();
  }

  void removeDartBot() {
    game.removeDartBot();
  }

  void setDartBotAverage(int average) {
    // TODO
    (game.players[game.dartBotIndex] as DartBot).targetAverage = average;
  }

  void addPlayer() {
    game.addPlayer(Player());
  }

  void removePlayer(int index) {
    game.removePlayer(index);
  }

  void setStartingPoints(int startingPoints) {
    game.config.startingPoints = startingPoints;
  }

  void setMode(Mode mode) {
    game.config.mode = mode;
  }

  void setSize(int size) {
    game.config.size = size;
  }

  void setType(Type type) {
    game.config.type = type;
  }

  void startGame() {
    game.start();
  }

  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    game.performThrow(Throw(points, dartsOnDouble, dartsThrown));
  }

  void undoThrow() {
    game.undoThrow();
  }
}
