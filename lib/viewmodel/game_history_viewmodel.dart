import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class GameHistoryViewModel extends ViewModel {
  Future<List<Game>> fetchGames() async {
    // TODO fetch data
    await Future.delayed(const Duration(seconds: 1), () {});
    return [
      Game.dummy(),
      Game.dummy(),
      Game.dummy(),
      Game.dummy(),
      Game.dummy(),
      Game.dummy(),
      Game.dummy(),
      Game.dummy(),
      Game.dummy(),
      Game.dummy(),
    ];
  }
}
