import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class GameHistoryViewModel extends ViewModel {
  Future<List<Game>> fetchGames() async {
    // TODO fetch data
    await Future.delayed(const Duration(seconds: 1), () {});
    return [
      Game(DateTime.utc(2021, 3, 1),'Best of 15 legs', 43.95, 13.73, true),
      Game(DateTime.utc(2021, 2, 23),'First to 11 legs', 84.38, 32.89, true),
      Game(DateTime.utc(2021, 2, 15),'First to 13 legs', 43.45, 26.14, false),
      Game(DateTime.utc(2021, 2, 11),'Best of 7 legs', 101.94, 46.49, true),
      Game(DateTime.utc(2021, 2, 11),'Best of 5 sets', 76.25, 36.98, true),
      Game(DateTime.utc(2021, 2, 1),'First to 12 legs', 94.25, 44.54, false),
      Game(DateTime.utc(2021, 1, 30),'First to 5 legs', 19.11, 0, false),
      Game(DateTime.utc(2021, 1, 20),'Best of 3 sets', 111.19, 67.88, true),
      Game(DateTime.utc(2021, 1, 10),'First to 7 legs', 11.55, 0, false),
      Game(DateTime.utc(2021, 1, 1),'Best of 5 legs', 89.55, 56.54, true),
    ];
  }
}
