import 'package:dart_counter/api/playing/playing_service.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class CreateGameViewModel extends ViewModel {

  final PlayingService _playingService = locator<PlayingService>();

  void onStartGamePressed() {
    // TODO
  }

  Stream<Game> get games => _playingService.games;
}
