import 'package:dart_counter/model/offline_game.dart';
import 'package:dart_counter/services/playing/playing_online_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class CreateOnlineGameViewModel extends ViewModel {

  /// OUT
  ValueStream<dynamic> get outputEvents;

  Future<bool> connect();

  Future<bool> disconnect();

  /// METHODS
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

  void onStartGamePressed();
}

class CreateOnlineGameViewModelImpl extends CreateOnlineGameViewModel {

  final PlayingOnlineService _playingOnlineService = PlayingOnlineService.instance;

  /// OUT
  @override
  ValueStream<dynamic> get outputEvents => _playingOnlineService.events;

  @override
  Future<bool> connect() async {
    return _playingOnlineService.connect();
  }

  @override
  Future<bool> disconnect() async {
    return _playingOnlineService.connect();
  }

  @override
  void createGame() {
    _playingOnlineService.createGame();
  }

  @override
  void joinGame(int gameCode) {
    _playingOnlineService.joinGame(gameCode);
  }

  @override
  void invitePlayer(String uid) {
    _playingOnlineService.invitePlayer(uid);
  }

  @override
  void reorderPlayer(int oldIndex, int newIndex) {
    _playingOnlineService.reorderPlayer(oldIndex, newIndex);
  }

  @override
  void removePlayer(int uid) {
    _playingOnlineService.removePlayer(uid);
  }

  @override
  void setStartingPoints(int startingPoints) {
    _playingOnlineService.setStartingPoints(startingPoints);
  }

  @override
  void setMode(Mode mode) {
    _playingOnlineService.setMode(mode);
  }

  @override
  void setSize(int size) {
    _playingOnlineService.setSize(size);
  }

  @override
  void setType(Type type) {
    _playingOnlineService.setType(type);
  }

  @override
  void startGame() {
    _playingOnlineService.startGame();
  }

  @override
  void cancelGame() {
    _playingOnlineService.cancelGame();
  }

  @override
  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _playingOnlineService.performThrow(points, dartsThrown, dartsOnDouble);
  }

  @override
  void undoThrow() {
    _playingOnlineService.undoThrow();
  }

  void onStartGamePressed() {
    _playingOnlineService.startGame();
  }
}