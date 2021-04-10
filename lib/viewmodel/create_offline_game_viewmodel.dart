import 'package:dart_counter/model/game/game.dart';
import 'package:dart_counter/model/game/offline_game.dart';
import 'package:dart_counter/services/playing/playing_offline_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class CreateOfflineGameViewModel extends ViewModel {

  /// IN
  void createGame();

  Sink get inputDartBotActive;

  /// OUT
  ValueStream<OfflineGame> get outputGames;

  ValueStream<bool> get outputDartBotActive;

  /// METHODS
  void onDartBotAverageChanged(int average);

  void onAddPlayerPressed();

  void onStartingPointsChanged(int startingPoints);

  void onModeChanged(Mode mode);

  void onSizeChanged(int size);

  void onTypeChanged(Type type);

  void onStartGamePressed();

  void onRemovePlayer(int id);

  void onNameChanged(int id, String newName);

  void onReorderPlayer(int oldIndex, int newIndex);
  
  void onCancelGamePressed();
}

class CreateOfflineGameViewModelImpl extends CreateOfflineGameViewModel {

  final PlayingOfflineService _playingOfflineService = PlayingOfflineService.instance;

  final BehaviorSubject _dartBotActiveController = BehaviorSubject();

  /// IN
  @override
  void createGame() {
    _playingOfflineService.createGame();
  }

  @override
  Sink get inputDartBotActive => _dartBotActiveController.sink;

  /// OUT
  @override
  ValueStream<OfflineGame> get outputGames => _playingOfflineService.games;

  @override
  ValueStream<bool> get outputDartBotActive => _dartBotActiveController.stream;

  /// METHODS
  @override
  void onDartBotAverageChanged(int average) {
    _playingOfflineService.setDartBotTargetAverage(average);
  }

  @override
  void onAddPlayerPressed() {
    _playingOfflineService.addPlayer();
  }

  @override
  void onStartingPointsChanged(int startingPoints) {
    _playingOfflineService.setStartingPoints(startingPoints);
  }

  @override
  void onModeChanged(Mode mode) {
    _playingOfflineService.setMode(mode);
  }

  void onSizeChanged(int size) {
    _playingOfflineService.setSize(size);
  }

  @override
  void onTypeChanged(Type type) {
    _playingOfflineService.setType(type);
  }

  void onStartGamePressed() {
    _playingOfflineService.startGame();
  }

  @override
  void onRemovePlayer(int id) {
    _playingOfflineService.removePlayer(id);
  }

  @override
  void onNameChanged(int id, String newName) {
    _playingOfflineService.updateName(id, newName);
  }

  @override
  void onReorderPlayer(int oldIndex, int newIndex) {
    _playingOfflineService.reorderPlayer(oldIndex, newIndex);
  }

  @override
  void onCancelGamePressed() {
    _playingOfflineService.cancelGame();
  }

  void dispose() {
    _dartBotActiveController.close();
  }

}