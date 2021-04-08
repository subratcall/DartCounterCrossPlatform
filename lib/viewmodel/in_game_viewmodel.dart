import 'package:dart_counter/model/offline_game.dart';
import 'package:dart_counter/services/playing/playing_offline_service.dart';
import 'package:dart_counter/services/playing/playing_online_service.dart';
import 'package:dart_counter/viewmodel/enum/key_type.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class InGameViewModel extends ViewModel {
  int inputPoints;
  OfflineGame currentSnapshot;

  void onUndoPressed();

  void onPerformThrowPressed();

  void onKeyPressed(KeyType key);
}

class InGameViewModelImpl extends InGameViewModel {
  final PlayingOnlineService _playingOnlineService = PlayingOnlineService.instance;
  final PlayingOfflineService _playingOfflineService = PlayingOfflineService.instance;

  final bool online;

  InGameViewModelImpl(this.online);

  int inputPoints = 0;
  OfflineGame currentSnapshot;

  void onUndoPressed() {
    // TODO reset only if true
    if(online) {
      _playingOnlineService.undoThrow();
    } else {
      _playingOfflineService.undoThrow();
    }
    inputPoints = 0;
  }

  @override
  void onPerformThrowPressed() {
    // TODO reset only if true
    if(online) {
      _playingOnlineService.undoThrow();
    } else {
      _playingOfflineService.undoThrow();
    }
    inputPoints = 0;
  }

  @override
  void onKeyPressed(KeyType key) {
    switch (key) {
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
        _eraseDigit();
        break;
    }
  }

  void _addDigit(int newDigit) {
    if (_digitIsValid(newDigit)) {
      inputPoints = int.parse(inputPoints.toString() + newDigit.toString());
    }
  }

  @override
  void _eraseDigit() {
    if (inputPoints != 0) {
      if (inputPoints < 10) {
        inputPoints = 0;
      } else {
        String temp = inputPoints.toString();
        inputPoints = int.parse(temp.substring(0, temp.length - 1));
      }
    }
  }

  bool _digitIsValid(int newDigit) {
    int pointsLeft = currentSnapshot.currentTurn.pointsLeft;

    int newInputPoints =
        int.parse(inputPoints.toString() + newDigit.toString());

    if (newInputPoints == 0) return false;
    return true;
    //return _playingService.validatePoints(newInputPoints, pointsLeft);
  }

  @override
  void dispose() {}
}
