import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/playing/playing_service.dart';
import 'package:dart_counter/services/playing/service.dart';
import 'package:dart_counter/viewmodel/enum/key_type.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class InGameViewModel extends ViewModel {

  final PlayingService _playingService = locator<PlayingService>();

  int _inputPoints = 0;
  Game _currentSnapshot;

  Game get currentSnapshot => _currentSnapshot;
  set currentSnapshot(Game snapshot) {
    _currentSnapshot = snapshot;
    notifyListeners();
  }

  int get inputPoints => _inputPoints;
  set inputPoints(int inputPoints) {
    _inputPoints = inputPoints;
    notifyListeners();
  }

  InGameViewModel() {
    currentSnapshot = _playingService.gameSnapshot;
    subscriptions.add(_playingService.onEvent().listen((event) {
      if(event is SnapshotEvent) {
        currentSnapshot = event.item as Game;
      }
    }));
  }

  void onUndoPressed() {
    // TODO reset only if true
    _playingService.undoThrow();
    inputPoints = 0;
  }

  void onPerformThrowPressed() {
    // TODO reset only if true
    _playingService.performThrow(inputPoints);
    inputPoints = 0;
  }

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
    int pointsLeft = _currentSnapshot.currentTurn.pointsLeft;

    int newInputPoints = int.parse(inputPoints.toString() + newDigit.toString());

    if(newInputPoints == 0) return false;
    return _playingService.validatePoints(newInputPoints, pointsLeft);
  }

}
