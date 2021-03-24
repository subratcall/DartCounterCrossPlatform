import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/services/playing/playing_service.dart';
import 'package:dart_counter/services/playing/service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:dart_game/dart_game.dart';

class CreateGameViewModel extends ViewModel {
  final PlayingService _playingService = locator<PlayingService>();

  GameSnapshot _currentSnapshot = GameSnapshot.seed(Status.pending);

  GameSnapshot get currentSnapshot => _currentSnapshot;
  set currentSnapshot(GameSnapshot snapshot) {
    _currentSnapshot = snapshot;
    notifyListeners();
  }

  CreateGameViewModel() {
    subscriptions.add(_playingService.onEvent().listen((event) {
      if(event is SnapshotEvent) {
        currentSnapshot = event.item as GameSnapshot;
      }
    }));

    _playingService.createGame();
  }

  void onDartBotActiveChanged(bool isActive) {
    isActive ? _playingService.addDartBot() : _playingService.removeDartBot();
  }

  void onDartBotAverageChanged(int average) {
    _playingService.setDartBotAverage(average);
  }

  void onAddPlayerPressed() {
    _playingService.addPlayer();
  }

  void onStartingPointsChanged(int startingPoints) {
    _playingService.setStartingPoints(startingPoints);
  }

  void onModeChanged(Mode mode) {
    _playingService.setMode(mode);
  }

  void onSizeChanged(int size) {
    _playingService.setSize(size);
  }

  void onTypeChanged(Type type) {
    _playingService.setType(type);
  }

  void onStartGamePressed() {
    _playingService.startGame();
  }

  void onRemovePlayer(int id) {
    _playingService.removePlayer(id);
  }

}
