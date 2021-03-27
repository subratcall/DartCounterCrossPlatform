import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/playing/playing_service.dart';
import 'package:dart_counter/services/playing/service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class CreateGameViewModel extends ViewModel {
  final PlayingService _playingService = locator<PlayingService>();

  Game _currentSnapshot;

  bool _dartBotIsActive = false;

  Game get currentSnapshot => _currentSnapshot;
  set currentSnapshot(Game snapshot) {
    _currentSnapshot = snapshot;
    notifyListeners();
  }

  bool get dartBotIsActive => _dartBotIsActive;
  set dartBotIsActive(bool dartBotIsActive) {
    _dartBotIsActive = dartBotIsActive;
    notifyListeners();
  }


  CreateGameViewModel() {
    subscriptions.add(_playingService.onEvent().listen((event) {
      if (event is Event<Game>) {
        currentSnapshot = event.item;
      }
    }));

    _playingService.start();
    _playingService.createGame();
  }

  void onDartBotActiveChanged(bool isActive) {
    dartBotIsActive = isActive;
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

  void onNameChanged(int id, String newName) {
    _playingService.updateName(id, newName);
  }

  void onReorderPlayer(int oldIndex, int newIndex) {
    _playingService.reorderPlayer(oldIndex, newIndex);
  }
}
