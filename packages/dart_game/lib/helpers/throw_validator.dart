part of dart_game;

class ThrowValidator {
  static List<int> _oneDartFinishes = [
    2,
    4,
    6,
    8,
    10,
    12,
    14,
    16,
    18,
    20,
    22,
    24,
    26,
    28,
    30,
    32,
    34,
    36,
    38,
    40,
    50
  ];
  static List<int> _twoDartFinishes = [
        3,
        5,
        7,
        9,
        11,
        13,
        15,
        17,
        19,
        21,
        23,
        25,
        27,
        29,
        31,
        33,
        35,
        37,
        39
      ] +
      List.generate(58, (index) => index + 41) +
      [100, 101, 104, 107, 110];
  static List<int> _threeDartFinishes = [99, 102, 103, 105, 106, 108, 109, 160, 161, 164, 167, 170] +
      List.generate(158 - 111 + 1, (i) => i + 111);

  static bool isValid(Throw t, int pointsLeft) {
    if (t.points < 0 || t.points > 180) return false;
    if (t.dartsThrown < 1 || t.dartsThrown > 3) return false;
    if (t.dartsOnDouble < 0 || t.dartsOnDouble > 3) return false;
    if (pointsLeft < 0 || pointsLeft == 0 || pointsLeft == 1) return false;

    if (t.points > pointsLeft) return false;
    if (t.dartsOnDouble > t.dartsThrown) return false;
    if ([163, 166, 169, 172, 173, 175, 176, 178, 179].contains(t.points)) return false;
    if (pointsLeft - t.points == 1) return false;

    // oneDartFinish checked with 1st dart on double
    if (t.dartsThrown == 1 &&
        t.dartsOnDouble == 1 &&
        t.points == pointsLeft &&
        _oneDartFinishes.contains(pointsLeft)) return true;

    // oneDartFinish checked with 2nd dart on double
    if (t.dartsThrown == 2 &&
        t.dartsOnDouble == 2 &&
        t.points == pointsLeft &&
        _oneDartFinishes.contains(pointsLeft)) return true;

    // oneDartFinish != 2 nach umstellen checked with 1st dart on double || twoDartFinish checked with 1st dart on double
    if (t.dartsThrown == 2 &&
        t.dartsOnDouble == 1 &&
        t.points == pointsLeft &&
        ((pointsLeft != 2 && _oneDartFinishes.contains(pointsLeft)) || _twoDartFinishes.contains(pointsLeft)))
      return true;

    if (t.dartsThrown == 3) {
      if (t.dartsOnDouble == 3) {
        // oneDartFinish check with 3rd dart on double || or gerade - 0 - t.points-gerade
        if (_oneDartFinishes.contains(pointsLeft)) return true;
      } else if (t.dartsOnDouble == 2) {
        // oneDartFinish != 2 (umstellen, miss, check with 2nd dart on double)
        if (pointsLeft != 2 && _oneDartFinishes.contains(pointsLeft)) return true;
        // twoDartFinish(stellen, miss, check with 2nd dart on double)
        if (t.points == pointsLeft && _twoDartFinishes.contains(pointsLeft)) return true;
        // twoDartFinish stellen with first dart then one dartFinish left, throw something lessequal 50 with to remaining darts (first dart equal)
        if (pointsLeft - t.points <= 50 && _twoDartFinishes.contains(pointsLeft))
          return true; // TODO is correct?
      } else if (t.dartsOnDouble == 1) {
        // oneDartFinish != 2 (umstellen miss), umstellen, oneDartThrowable)
        if (pointsLeft != 2 && _oneDartFinishes.contains(pointsLeft)) return true;

        // twoDartFinish(stellen miss, stellen, check with 1st dart on double)
        if (t.points == pointsLeft && _twoDartFinishes.contains(pointsLeft)) return true;
        if (pointsLeft - t.points <= 50 && _twoDartFinishes.contains(pointsLeft))
          return true; // TODO is correct?

        // threeDartFinish(stellen, stellen, check with 1st dart on double)
        if (t.points == pointsLeft && _threeDartFinishes.contains(pointsLeft)) return true;

        if (pointsLeft - t.points <= 50 && _threeDartFinishes.contains(pointsLeft))
          return true; // TODO is correct?
      } else {
        // no check
        if (t.points != pointsLeft) return true;
      }
    }

    return false;
  }
}
