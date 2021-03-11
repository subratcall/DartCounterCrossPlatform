import 'package:dart_counter/api/playing/playing_service.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class CreateGameViewModel extends ViewModel {
  final PlayingService _playingService = locator<PlayingService>();

  GameSnapshot _currentSnapshot;

  CreateGameViewModel() {
    subscriptions.add(_playingService.gameSnapshots.listen((snapshot) {
      currentSnapshot = snapshot;
    }));
  }

  void onStartGamePressed() {
    // TODO
  }

  GameSnapshot get currentSnapshot => _currentSnapshot;

  set currentSnapshot(GameSnapshot snapshot) {
    _currentSnapshot = snapshot;
    notifyListeners();
  }
}
