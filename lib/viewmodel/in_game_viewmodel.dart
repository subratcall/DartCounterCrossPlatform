import 'package:dart_counter/api/playing/offline/model/throw_validator.dart';
import 'package:dart_counter/api/playing/playing_service.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/viewmodel/enum/key_type.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class InGameViewModel extends ViewModel {
  final PlayingService _playingService = locator<PlayingService>();

  Stream<GameSnapshot> get gameSnapshots => _playingService.gameSnapshots;

  int inputPoints = 0;

  void onUndoPressed() {}

  void onPerformThrowPressed() {}

  void onKeyPressed(KeyType key) {
    switch(key) {
      case KeyType.one:
        _addDigit(1);
        break;
      case KeyType.two:
        _addDigit(2);
        break;
      case KeyType.three:
        _addDigit(3);
        break;
      case KeyType.four:
        _addDigit(4);
        break;
      case KeyType.five:
        _addDigit(5);
        break;
      case KeyType.six:
        _addDigit(6);
        break;
      case KeyType.seven:
        _addDigit(7);
        break;
      case KeyType.eight:
        _addDigit(8);
        break;
      case KeyType.nine:
        _addDigit(9);
        break;
      case KeyType.check:
        // TODO
        break;
      case KeyType.zero:
        _addDigit(0);
        break;
      case KeyType.erase:
        eraseDigit();
        break;

    }
  }

  void _addDigit(int newDigit) {
    if(_digitIsValid(newDigit)) {
      inputPoints = int.parse(inputPoints.toString() + newDigit.toString());
    }
  }

  void eraseDigit() {
    if(inputPoints != 0) {
      if(inputPoints < 10) {
        inputPoints = 0;
      } else {
        String temp = inputPoints.toString();
        inputPoints = int.parse(temp.substring(0, temp.length - 1));
      }
    }
  }

  bool _digitIsValid(int newDigit) {
    // TODO read current gamesnapshot from stream
    GameSnapshot game = GameSnapshot.seed(Status.RUNNING);
    int pointsLeft = 1;
    int newInputPoints = int.parse(inputPoints.toString() + newDigit.toString());

    if(newInputPoints == 0) return false;
    return ThrowValidator.isValidThrow(newInputPoints, pointsLeft);
  }


}
