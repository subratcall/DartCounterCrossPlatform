import 'package:dart_counter/api/playing/offline/model/mode.dart';
import 'package:dart_counter/api/playing/offline/model/status.dart';
import 'package:dart_counter/api/playing/offline/model/type.dart';
import 'package:dart_counter/api/playing/playing_service.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class CreateGameViewModel extends ViewModel {
  final PlayingService _playingService = locator<PlayingService>();

  GameSnapshot _currentSnapshot = GameSnapshot.seed(Status.pending);

  CreateGameViewModel() {
    /*subscriptions.add(_playingService.gameSnapshots.listen((snapshot) {
      currentSnapshot = snapshot;
    }));*/
  }

  void onDartBotActiveChanged(bool isActive) {
    isActive ? _playingService.addDartBot() : _playingService.removeDartBot();
  }

  void onDartBotAverageChanged(int average) {
    _playingService.setDartBotAverage(average);
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

  GameSnapshot get currentSnapshot => _currentSnapshot;

  set currentSnapshot(GameSnapshot snapshot) {
    _currentSnapshot = snapshot;
    notifyListeners();
  }
}
