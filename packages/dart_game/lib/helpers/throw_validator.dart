part of dart_game;

class ThrowValidator {

  static List<int> _oneDartFinishes = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50];
  static List<int> _threeDartFinishes = [99, 102, 103, 105, 106, 108, 109, 160, 161, 164, 167, 170] + List.generate(158 - 111 + 1, (i) => i + 111);

  // Fertig
  static bool isValidThrowWithZeroDartsOnDouble(int points, int pointsLeft) {
    if (points < 0 || points > 180) throw ArgumentError.value(points, 'points');
    if (pointsLeft < 0 || pointsLeft == 0 || pointsLeft == 1) throw ArgumentError.value(pointsLeft, 'pointsLeft');

    if (points > pointsLeft) return false;
    if ([163, 166, 169, 172, 173, 175, 176, 178, 179].contains(points)) return false;
    return true;
  }

  static bool isValidThrowWithOneDartOnDouble(int points, int pointsLeft) {
    if (points < 0 || points > 180) throw ArgumentError.value(points, 'points');
    if (pointsLeft < 0 || pointsLeft == 0 || pointsLeft == 1) throw ArgumentError.value(pointsLeft, 'pointsLeft');

    if (points > pointsLeft) return false;
    if (points == 0) {
      if(pointsLeft > 170 || [169, 168, 166, 165, 163, 162, 159].contains(pointsLeft)) {
        return false;
      }
      return true;
    }
    if (points == 1) {
      if(pointsLeft > 2 && _oneDartFinishes.contains(pointsLeft)) {
        return true;
      } else if(_oneDartFinishes.contains(pointsLeft-1)) {
        return true;
      }
      return false;
    }
    return true;
    // TODO when person throws 10 with 150 left and says 1 dart on double
  }

  static bool isValidThrowWithTwoDartsOnDouble(int points, int pointsLeft) {
    if (points < 0 || points > 180) throw ArgumentError.value(points, 'points');
    if (pointsLeft < 0 || pointsLeft == 0 || pointsLeft == 1) throw ArgumentError.value(pointsLeft, 'pointsLeft');

    if (points > pointsLeft) return false;

    if (points == 0) {
      if(pointsLeft < 110 && !_threeDartFinishes.contains(pointsLeft)) {
        return true;
      }
      return false;
    }
    if (points == 1) {
      if(pointsLeft > 2 && _oneDartFinishes.contains(pointsLeft)) {
        return true;
      } else if(_oneDartFinishes.contains(pointsLeft-1)) {
        return true;
      }
      return false;
    }
    if(pointsLeft < 110 && !_threeDartFinishes.contains(pointsLeft)) return true;
    return false;
    // TODO when person throws 10 with 150 left and says 2 dart on double
  }

  // Fertig
  static bool isValidThrowWithThreeDartsOnDouble(int points, int pointsLeft) {
    if (points < 0 || points > 180) throw ArgumentError.value(points, 'points');
    if (pointsLeft < 0 || pointsLeft == 0 || pointsLeft == 1) throw ArgumentError.value(pointsLeft, 'pointsLeft');

    if (points > pointsLeft) return false;
    if (points > 50) return false;
    if(!_oneDartFinishes.contains(pointsLeft)) return false;
    return true;
  }

  // Fertig
  static bool isValidThrowWithOneDartThrown(int points, int pointsLeft) {
    if (points < 0 || points > 180) throw ArgumentError.value(points, 'points');
    if (pointsLeft < 0 || pointsLeft == 0 || pointsLeft == 1) throw ArgumentError.value(pointsLeft, 'pointsLeft');

    if (points == 0 && pointsLeft <= 60) return true;
    if (points == pointsLeft && _oneDartFinishes.contains(points)) return true;
    return false;
  }

  // Fertig
  static bool isValidThrowWithTwoDartsThrown(int points, int pointsLeft) {
    if (points < 0 || points > 180) throw ArgumentError.value(points, 'points');
    if (pointsLeft < 0 || pointsLeft == 0 || pointsLeft == 1) throw ArgumentError.value(pointsLeft, 'pointsLeft');

    if (points == 0 && pointsLeft <= 120) return true;
    if (points != pointsLeft) return false;
    if (points > 110) return false;
    if ([99, 102, 103, 105, 106, 108, 109].contains(points)) return false;
    return true;
  }

  // Fertig
  static bool isValidThrowWithThreeDartsThrown(int points, int pointsLeft) {
    return isValidThrowWithZeroDartsOnDouble(points, pointsLeft);
  }


  static bool isValidThrow(int points, int pointsLeft, {int dartsThrown = 3, dartsOnDouble = 0}) {
    if (points < 0 || points > 180) throw ArgumentError.value(points, 'points');
    if (pointsLeft < 0 || pointsLeft == 0 || pointsLeft == 1) throw ArgumentError.value(pointsLeft, 'pointsLeft');
    if (dartsThrown < 1 || dartsThrown > 3) throw ArgumentError.value(dartsThrown, 'dartsThrown');
    if (dartsOnDouble < 0 || dartsOnDouble > 3) throw ArgumentError.value(dartsOnDouble, 'dartsOnDouble');

    if (points > pointsLeft) return false;

    if (points == 0 && dartsThrown != 3) return false;
    if (pointsLeft-points == 1) return false;
    if ([163, 166, 169, 172, 173, 175, 176, 178, 179].contains(points)) return false;

    if(dartsThrown == 1) {
      if(dartsOnDouble == 0) return isValidThrowWithOneDartThrown(points, pointsLeft) && isValidThrowWithZeroDartsOnDouble(points, pointsLeft);
      if(dartsOnDouble == 1) return isValidThrowWithOneDartThrown(points, pointsLeft) && isValidThrowWithOneDartOnDouble(points, pointsLeft);
      if(dartsOnDouble == 2) return isValidThrowWithOneDartThrown(points, pointsLeft) && isValidThrowWithTwoDartsOnDouble(points, pointsLeft);
      if(dartsOnDouble == 3) return isValidThrowWithOneDartThrown(points, pointsLeft) && isValidThrowWithThreeDartsOnDouble(points, pointsLeft);
    }

    if(dartsThrown == 2) {
      if(dartsOnDouble == 0) return isValidThrowWithTwoDartsThrown(points, pointsLeft) && isValidThrowWithZeroDartsOnDouble(points, pointsLeft);
      if(dartsOnDouble == 1) return isValidThrowWithTwoDartsThrown(points, pointsLeft) && isValidThrowWithOneDartOnDouble(points, pointsLeft);
      if(dartsOnDouble == 2) return isValidThrowWithTwoDartsThrown(points, pointsLeft) && isValidThrowWithTwoDartsOnDouble(points, pointsLeft);
      if(dartsOnDouble == 3) return isValidThrowWithTwoDartsThrown(points, pointsLeft) && isValidThrowWithThreeDartsOnDouble(points, pointsLeft);
    }

    if(dartsThrown == 3) {
      if(dartsOnDouble == 0) return isValidThrowWithThreeDartsThrown(points, pointsLeft) && isValidThrowWithZeroDartsOnDouble(points, pointsLeft);
      if(dartsOnDouble == 1) return isValidThrowWithThreeDartsThrown(points, pointsLeft) && isValidThrowWithOneDartOnDouble(points, pointsLeft);
      if(dartsOnDouble == 2) return isValidThrowWithThreeDartsThrown(points, pointsLeft) && isValidThrowWithTwoDartsOnDouble(points, pointsLeft);
      if(dartsOnDouble == 3) return isValidThrowWithThreeDartsThrown(points, pointsLeft) && isValidThrowWithThreeDartsOnDouble(points, pointsLeft);
    }
  }
}