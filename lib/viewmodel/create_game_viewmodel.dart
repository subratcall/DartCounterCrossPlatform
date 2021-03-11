import 'package:dart_counter/api/playing/playing_service.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class CreateGameViewModel extends ViewModel {
  final PlayingService _playingService = locator<PlayingService>();

  void onStartGamePressed() {
    // TODO
  }

  Stream<GameSnapshot> get gameSnapshots => _playingService.gameSnapshots;
}
