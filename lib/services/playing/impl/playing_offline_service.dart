import 'package:dart_game/dart_game.dart';
import 'package:rxdart/rxdart.dart';

abstract class PlayingOfflineService {

  static PlayingOfflineService _instance = PlayingOfflineServiceImpl._();

  /// SINGLETON INSTANCE
  static PlayingOfflineService get instance {
    if (_instance == null) {
      _instance = PlayingOfflineServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE

  ValueStream<Game> get games;

  void createGame();

  void addDartBot();

  void removeDartBot();

  void setDartBotTargetAverage(int targetAverage);

  void addPlayer();

  void updateName(int id, String newName);

  void reorderPlayer(int oldIndex, int newIndex);

  void removePlayer(int id);

  void setStartingPoints(int startingPoints);

  void setMode(Mode mode);

  void setSize(int size);

  void setType(Type type);

  void startGame();

  void performThrow(int points, int dartsThrown, int dartsOnDouble);

  void undoThrow();
}

class PlayingOfflineServiceImpl implements PlayingOfflineService {
  PlayingOfflineServiceImpl._();

  Game _game;
  BehaviorSubject<Game> _gamesController = new BehaviorSubject();

  ValueStream<Game> get games => _gamesController.stream;

  @override
  void createGame() {
    _game = Game();
    _gamesController.add(_game);
  }

  @override
  void addDartBot() {
    _game.addDartBot();
    _gamesController.add(_game);
  }

  @override
  void removeDartBot() {
    _game.removeDartBot();
    _gamesController.add(_game);
  }

  @override
  void setDartBotTargetAverage(int targetAverage) {
    _game.setDartBotTargetAverage(targetAverage);
  }

  @override
  void addPlayer() {
    _game.addPlayer();
    _gamesController.add(_game);
  }

  @override
  void updateName(int id, String newName) {
    _game.players.firstWhere((player) => player.id == id).name = newName;
  }

  @override
  void reorderPlayer(int oldIndex, int newIndex) {
    _game.reorderPlayer(oldIndex, newIndex);
    _gamesController.add(_game);
  }

  @override
  void removePlayer(int id) {
    _game.removePlayer(id);
    _gamesController.add(_game);
  }

  @override
  void setStartingPoints(int startingPoints) {
    _game.config.startingPoints = startingPoints;
  }

  @override
  void setMode(Mode mode) {
    _game.config.mode = mode;
  }

  @override
  void setSize(int size) {
    _game.config.size = size;
  }

  @override
  void setType(Type type) {
    _game.config.type = type;
  }

  @override
  void startGame() {
    _game.start();
    _gamesController.add(_game);
  }

  @override
  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _game.performThrow(
        Throw(points, dartsThrown: dartsThrown, dartsOnDouble: dartsOnDouble));
    _gamesController.add(_game);
  }

  @override
  void undoThrow() {
    _game.undoThrow();
    _gamesController.add(_game);
  }

  dispose() {
    _gamesController.close();
  }

}
