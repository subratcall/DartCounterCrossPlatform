import 'package:dart_game/dart_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isValidThrowWithZeroDartsOnDouble', () {
    test('GIVEN points < 0 WHEN isValidThrowWithZeroDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrowWithZeroDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrowWithZeroDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrowWithZeroDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrowWithZeroDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN points > pointsLeft WHEN isValidThrowWithZeroDartsOnDouble is called THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithZeroDartsOnDouble(points, pointsLeft), false);
    });
    test('GIVEN points that can be scored with zero dartsOnDouble WHEN isValidThrowWithZeroDartsOnDouble is called THEN return true', () {
      // Arrange
      final List<int> validPoints = List.generate(180, (index) => index+1);
      validPoints.removeWhere((element) => [163, 166, 169, 172, 173, 175, 176, 178, 179].contains(element));

      // Act & Assert
      for(int points in validPoints) {
        expect(ThrowValidator.isValidThrowWithZeroDartsOnDouble(points, 501), true);
      }
    });
    test('GIVEN points that can not be scored with zero dartsOnDouble WHEN isValidThrowWithZeroDartsOnDouble is called THEN return false', () {
      // Arrange
      final List<int> invalidPoints = [163, 166, 169, 172, 173, 175, 176, 178, 179];

      // Act & Assert
      for(int points in invalidPoints) {
        expect(ThrowValidator.isValidThrowWithZeroDartsOnDouble(points, 501), false);
      }
    });
  });

  group('isValidThrowWithOneDartOnDouble', () {
    test('GIVEN points < 0 WHEN isValidThrowWithOneDartOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrowWithOneDartOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrowWithOneDartOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrowWithOneDartOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrowWithOneDartOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN points > pointsLeft WHEN isValidThrowWithOneDartOnDouble is called THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithOneDartOnDouble(points, pointsLeft), false);
    });
    // TODO
  });

  group('isValidThrowWithTwoDartsOnDouble', () {
    test('GIVEN points < 0 WHEN isValidThrowWithTwoDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrowWithTwoDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrowWithTwoDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrowWithTwoDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrowWithTwoDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN points > pointsLeft WHEN isValidThrowWithTwoDartsOnDouble is called THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithTwoDartsOnDouble(points, pointsLeft), false);
    });
    // TODO
  });

  group('isValidThrowWithThreeDartsOnDouble', () {
    test('GIVEN points < 0 WHEN isValidThrowWithThreeDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrowWithThreeDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrowWithThreeDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrowWithThreeDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrowWithThreeDartsOnDouble is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN points > pointsLeft WHEN isValidThrowWithThreeDartsOnDouble is called THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, pointsLeft), false);
    });
    test('GIVEN points = singleDartFinish and pointsLeft = singleDartFinish WHEN isValidThrowWithThreeDartsOnDouble is called THEN return true', () {
      // Arrange
      final List<int> points = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50];
      final List<int> pointsLeft = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50];

      // Act & Assert
      for(int p in points) {
        for(int pl in pointsLeft) {
          if(p < pl) {
            expect(ThrowValidator.isValidThrowWithThreeDartsOnDouble(p, pl), true);
          }
        }
      }
    });
    test('GIVEN points != singleDartFinish and pointsLeft = singleDartFinish WHEN isValidThrowWithThreeDartsOnDouble is called THEN return false', () {
      // Arrange
      final int points = 3;
      final List<int> pointsLeft = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50];

      // Act & Assert
      for(int pl in pointsLeft) {
        if(points < pl) {
          expect(ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, pl), false);
        }
      }
    });
    test('GIVEN points = singleDartFinish and pointsLeft != singleDartFinish WHEN isValidThrowWithThreeDartsOnDouble is called THEN return false', () {
      // Arrange
      final int points = 2;
      final List<int> pointsLeft = List.generate(180, (index) => index+1);
      pointsLeft.removeWhere((element) => [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50].contains(element) || element == 1);

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, pl), true);
      }
    });
    test('GIVEN points != singleDartFinish and pointsLeft != singleDartFinish WHEN isValidThrowWithThreeDartsOnDouble is called THEN return false', () {
      // Arrange
      final int points = 3;
      final int pointsLeft = 3;
      // Act & Assert
      expect(ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, points), false);
    });
  });

  group('isValidThrowWithOneDartThrown', () {
    test('GIVEN points < 0 WHEN isValidThrowWithOneDartThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrowWithOneDartThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrowWithOneDartThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrowWithOneDartThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrowWithOneDartThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN points > pointsLeft WHEN isValidThrowWithOneDartThrown is called THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithOneDartThrown(points, pointsLeft), false);
    });
    // TODO
  });

  group('isValidThrowWithTwoDartsThrown', () {
    test('GIVEN points < 0 WHEN isValidThrowWithTwoDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrowWithTwoDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrowWithTwoDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrowWithTwoDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrowWithTwoDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN points > pointsLeft WHEN isValidThrowWithTwoDartsThrown is called THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithTwoDartsThrown(points, pointsLeft), false);
    });
    // TODO
  });

  group('isValidThrowWithThreeDartsThrown', () {
    test('GIVEN points < 0 WHEN isValidThrowWithThreeDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrowWithThreeDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrowWithThreeDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrowWithThreeDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrowWithThreeDartsThrown is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN points > pointsLeft WHEN isValidThrowWithThreeDartsThrown is called THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithThreeDartsThrown(points, pointsLeft), false);
    });
    // TODO
  });

  group('isValidThrow', () {
    test('GIVEN points < 0 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(points, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(points, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN dartsThrown < 1 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int dartsThrown = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsThrown: dartsThrown), throwsArgumentError);
    });
    test('GIVEN dartsThrown > 3 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int dartsThrown = 4;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsThrown: dartsThrown), throwsArgumentError);
    });
    test('GIVEN dartsOnDouble < 0 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int dartsOnDouble = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsOnDouble: dartsOnDouble), throwsArgumentError);
    });
    test('GIVEN dartsOnDouble > 3 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int dartsOnDouble = 4;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsOnDouble: dartsOnDouble), throwsArgumentError);
    });

    /*test('GIVEN points > pointsLeft WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int points = 100;
      final int pointsLeft = 50;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(points, pointsLeft), false);
    });
    test('GIVEN points = 0, dartsThrown != 3 WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int points = 0;
      final int dartsThrown = 2;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(points, 501, dartsThrown: dartsThrown), false);
    });
    test('GIVEN pointsLeft-points = 1, WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int points = 11;
      final int pointsLeft = 12;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(points, pointsLeft), false);
    });
    group('GIVEN points that can not be scored with 3 darts WHEN isValidThrow is called THEN return false', () {

      final List<int> canNotBeScoredWithThreeDarts = [163, 166, 169, 172, 173, 175, 176, 178, 179];

      // Arrange
      for(int points in canNotBeScoredWithThreeDarts) {
        test('$points -> false', () {
          // Act & Assert
          expect(ThrowValidator.isValidThrow(points, 501), false);
        });
      }
    });

    test('GIVEN dartsOnDouble > dartsThrown WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int dartsOnDouble = 3;
      final int dartsThrown = 1;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(60, 501, dartsThrown: dartsThrown, dartsOnDouble: dartsOnDouble), false);
    });
    test('GIVEN dartsOnDouble > 0, pointsLeft is not checkable with 3 darts WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int dartsOnDouble = 2;
      final int pointsLeft = 200;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(60, pointsLeft, dartsOnDouble: dartsOnDouble), false);
    });
    test('GIVEN dartsOnDouble = 2, pointsLeft is only checkable with 3 darts WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int dartsOnDouble = 2;
      final int pointsLeft = 170;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(60, pointsLeft, dartsOnDouble: dartsOnDouble), false);
    });
    test('GIVEN dartsOnDouble = 3, pointsLeft is not checkable with 1 dart WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int dartsOnDouble = 3;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(60, pointsLeft, dartsOnDouble: dartsOnDouble), false);
    });

    test('GIVEN points = 170, dartsThrown = 1, dartsOnDouble = 1, WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int points = 170;
      final int dartsThrown = 1;
      final int dartsOnDouble = 1;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(points, 170, dartsThrown: dartsThrown, dartsOnDouble: dartsOnDouble), false);
    });*/
  });
}
