import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class GameHistoryViewModel extends ViewModel {
  Future<List<Game>> fetchGames() async {
    // TODO fetch data
    await Future.delayed(const Duration(seconds: 2), () {});
    return [
      Game(),
      Game(),
      Game(),
      Game(),
      Game(),
      Game(),
      Game(),
      Game(),
      Game(),
      Game(),
    ];
  }
}
