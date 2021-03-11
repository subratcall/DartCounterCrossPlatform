class ThrowValidator {
  
  static bool isValidThrow(int points, int pointsLeft, {int dartsThrown = 3, dartsOnDouble = 0}) {
    if (points < 0 || points > 180) return false;
    if (points == 0 && dartsThrown != 3) return false;
    if (points > pointsLeft) return false;
    if ([163, 166, 169, 172, 173, 175, 176, 178, 179].contains(points)) return false;

    if (dartsThrown < 1 || dartsThrown > 3) return false;

    if (dartsOnDouble < 0 || dartsOnDouble > 3) return false;
    if (dartsOnDouble > dartsThrown) return false;
    if (dartsOnDouble > 0 && !isThreeDartFinish(pointsLeft)) return false;
    if (dartsOnDouble == 2 && (isThreeDartFinish(pointsLeft) && !isOneDartFinish(pointsLeft) && !isTwoDartFinish(pointsLeft)))
      return false;
    if (dartsOnDouble == 3 && !isOneDartFinish(pointsLeft)) return false;
    return pointsLeft != 2 || dartsOnDouble == dartsThrown;
  }

  static bool isThreeDartFinish(int points) {
    if (points < 2 || points > 170) return false;
    return ![159, 162, 163, 165, 166, 168, 169].contains(points);
  }


  static bool isTwoDartFinish(int points) {
    if (points < 2 || points > 110) return false;
    return ![99, 102, 103, 105, 106, 108, 109].contains(points);
  }


  static bool isOneDartFinish(int points) {
    if (points < 2 || points > 50) return false;
    return points == 50 || (points <= 40 && points % 2 == 0);
  }
}