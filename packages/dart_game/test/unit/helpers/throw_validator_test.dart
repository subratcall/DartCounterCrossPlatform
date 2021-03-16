import 'package:dart_game/dart_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Fertig
  group('isValidThrowWithZeroDartsOnDouble', () {
    test('GIVEN valid pointsLeft WHEN points < 0 THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN points > 180 THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = < 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 1 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithZeroDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points, pointsLeft WHEN points > pointsLeft THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithZeroDartsOnDouble(points, pointsLeft), false);
    });
    test('GIVEN valid pointsLeft, pointsLeft >= points WHEN points cant be scored with 3 darts THEN return false', () {
      // Arrange
      final List<int> points = [163, 166, 169, 172, 173, 175, 176, 178, 179];
      final int pointsLeft = 180;

      // Act & Assert
      for(int p in points) {
        expect(ThrowValidator.isValidThrowWithZeroDartsOnDouble(p, pointsLeft), false);
      }
    });
    test('GIVEN valid pointsLeft, pointsLeft >= points WHEN points can be scored with 3 darts THEN return true', () {
      // Arrange
      final List<int> points = List.generate(181, (index) => index);
      points.removeWhere((element) => [163, 166, 169, 172, 173, 175, 176, 178, 179].contains(element));
      final int pointsLeft = 180;

      // Act & Assert
      for(int p in points) {
        expect(ThrowValidator.isValidThrowWithZeroDartsOnDouble(p, pointsLeft), true);
      }
    });
  });


  group('isValidThrowWithOneDartOnDouble', () {
    test('GIVEN valid pointsLeft WHEN points < 0 THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN points > 180 THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = < 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 1 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartOnDouble(60, pointsLeft), throwsArgumentError);
    });

    test('GIVEN valid points, pointsLeft WHEN points > pointsLeft THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithOneDartOnDouble(points, pointsLeft), false);
    });
    // TODO
  });


  group('isValidThrowWithTwoDartsOnDouble', () {
    test('GIVEN valid pointsLeft WHEN points < 0 THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN points > 180 THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = < 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 1 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });

    test('GIVEN valid points, pointsLeft WHEN points > pointsLeft THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithTwoDartsOnDouble(points, pointsLeft), false);
    });
    // TODO
  });

  // Fertig
  group('isValidThrowWithThreeDartsOnDouble', () {
    test('GIVEN valid pointsLeft WHEN points < 0 THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN points > 180 THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, 501), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = < 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 1 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsOnDouble(60, pointsLeft), throwsArgumentError);
    });

    test('GIVEN valid points, pointsLeft WHEN points > pointsLeft THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithThreeDartsOnDouble(points, pointsLeft), false);
    });
    test('GIVEN points <= pointsLeft WHEN pointsLeft is oneDartFinish THEN return true', () {
      // Arrange
      final List<int> pointsLeft = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50];

      // Act & Assert
      for(int pl in pointsLeft) {
        final List<int> points = List.generate(pl, (index) => index+1);
        for(int p in points) {
          expect(ThrowValidator.isValidThrowWithThreeDartsOnDouble(p, pl), true);
        }
      }
    });
    test('GIVEN points <= pointsLeft WHEN points > 50 THEN return false', () {
      // Arrange
      final List<int> points = List.generate(180 - 50, (index) => index + 51);


      // Act & Assert
      for(int p in points) {
        expect(ThrowValidator.isValidThrowWithThreeDartsOnDouble(p, p+1), false);
      }
    });
  });

  // Fertig
  group('isValidThrowWithOneDartThrown', () {
    test('GIVEN valid pointsLeft WHEN points < 0 THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN points > 180 THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = < 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 1 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithOneDartThrown(60, pointsLeft), throwsArgumentError);
    });

    test('GIVEN nothing WHEN points != pointsLeft THEN return false', () {
      // Arrange
      final List<int> points = List.generate(179, (index) => index+2);

      // Act & Assert
      for(int p in points) {
        expect(ThrowValidator.isValidThrowWithOneDartThrown(p, p+1), false);
      }
    });
    test('GIVEN nothing WHEN points = 0 and pointsLeft can be overthrown with one dart THEN return true', () {
      // Arrange
      final int points = 0;
      final List <int> pointsLeft = List.generate(59, (index) => index+2);

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithOneDartThrown(points, pl), true);
      }
    });
    test('GIVEN nothing WHEN points = 0 and pointsLeft can not be overthrown with one dart THEN return false', () {
      // Arrange
      final int points = 0;
      final List <int> pointsLeft = List.generate(120, (index) => index+61);

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithOneDartThrown(points, pl), false);
      }
    });
    test('GIVEN valid pointsLeft WHEN points 1 THEN return false', () {
      // Arrange
      final int points = 1;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithOneDartThrown(points, 40), false);
    });
    test('GIVEN nothing WHEN points = pointsLeft and pointsLeft is OneDartFinish THEN return true', () {
      // Arrange
      final List <int> pointsLeft = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50];

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithOneDartThrown(pl, pl), true);
      }
    });
    test('GIVEN nothing WHEN points = pointsLeft and pointsLeft is not OneDartFinish < 50 THEN return false', () {
      // Arrange
      final List <int> pointsLeft = List.generate(49, (index) => index+2);
      pointsLeft.removeWhere((element) => [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50].contains(element));

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithOneDartThrown(pl, pl), false);
      }
    });
    test('GIVEN nothing WHEN points = pointsLeft and pointsLeft > 50 THEN return false', () {
      // Arrange
      final List <int> pointsLeft = List.generate(130, (index) => index+51);

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithOneDartThrown(pl, pl), false);
      }
    });
  });

  // Fertig
  group('isValidThrowWithTwoDartsThrown', () {
    test('GIVEN valid pointsLeft WHEN points < 0 THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN points > 180 THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = < 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 1 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithTwoDartsThrown(60, pointsLeft), throwsArgumentError);
    });

    test('GIVEN nothing WHEN points != pointsLeft THEN return false', () {
      // Arrange
      final List<int> points = List.generate(179, (index) => index+2);

      // Act & Assert
      for(int p in points) {
        expect(ThrowValidator.isValidThrowWithTwoDartsThrown(p, p+1), false);
      }
    });
    test('GIVEN valid points, pointsLeft WHEN points > pointsLeft THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithTwoDartsThrown(points, pointsLeft), false);
    });
    test('GIVEN nothing WHEN points = 0 and pointsLeft can be overthrown with two dart THEN return true', () {
      // Arrange
      final int points = 0;
      final List <int> pointsLeft = List.generate(119, (index) => index+2);

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithTwoDartsThrown(points, pl), true);
      }
    });
    test('GIVEN nothing WHEN points = 0 and pointsLeft can not be overthrown with two dart THEN return false', () {
      // Arrange
      final int points = 0;
      final List <int> pointsLeft = List.generate(60, (index) => index+121);

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithTwoDartsThrown(points, pl), false);
      }
    });
    test('GIVEN valid pointsLeft WHEN points 1 THEN return false', () {
      // Arrange
      final int points = 1;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithTwoDartsThrown(points, 40), false);
    });
    test('GIVEN nothing WHEN points = pointsLeft and pointsLeft is not ThreeDartFinish <= 110 THEN return true', () {
      // Arrange
      final List <int> pointsLeft = List.generate(109, (index) => index+2);
      pointsLeft.removeWhere((element) => [99, 102, 103, 105, 106, 108, 109].contains(element));

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithTwoDartsThrown(pl, pl), true);
      }
    });
    test('GIVEN nothing WHEN points = pointsLeft and pointsLeft is ThreeDartFinish THEN return false', () {
      // Arrange
      final List <int> pointsLeft = [99, 102, 103, 105, 106, 108, 109, 160, 161, 164, 167, 170] + List.generate(158 - 111 + 1, (i) => i + 111);

      // Act & Assert
      for(int pl in pointsLeft) {
        expect(ThrowValidator.isValidThrowWithTwoDartsThrown(pl, pl), false);
      }
    });
  });

  // Fertig
  group('isValidThrowWithThreeDartsThrown', () {
    test('GIVEN valid pointsLeft WHEN points < 0 THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN points > 180 THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(points, 501), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = < 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 1 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrowWithThreeDartsThrown(60, pointsLeft), throwsArgumentError);
    });

    test('GIVEN valid points, pointsLeft WHEN points > pointsLeft THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrowWithThreeDartsThrown(points, pointsLeft), false);
    });
    test('GIVEN valid pointsLeft, pointsLeft >= points WHEN points cant be scored with 3 darts THEN return false', () {
      // Arrange
      final List<int> points = [163, 166, 169, 172, 173, 175, 176, 178, 179];
      final int pointsLeft = 180;

      // Act & Assert
      for(int p in points) {
        expect(ThrowValidator.isValidThrowWithThreeDartsThrown(p, pointsLeft), false);
      }
    });
    test('GIVEN valid pointsLeft, pointsLeft >= points WHEN points can be scored with 3 darts THEN return true', () {
      // Arrange
      final List<int> points = List.generate(181, (index) => index);
      points.removeWhere((element) => [163, 166, 169, 172, 173, 175, 176, 178, 179].contains(element));
      final int pointsLeft = 180;

      // Act & Assert
      for(int p in points) {
        expect(ThrowValidator.isValidThrowWithThreeDartsThrown(p, pointsLeft), true);
      }
    });
  });


  group('isValidThrow', () {
    test('GIVEN valid pointsLeft WHEN points < 0 THEN throw ArgumentError', () {
      // Arrange
      final int points = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(points, 501), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN points > 180 THEN throw ArgumentError', () {
      // Arrange
      final int points = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(points, 501), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = < 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points WHEN pointsLeft = 0 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid pointsLeft WHEN pointsLeft = 1 THEN throw ArgumentError', () {
      // Arrange
      final int pointsLeft = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, pointsLeft), throwsArgumentError);
    });
    test('GIVEN valid points, pointsLeft TODO WHEN dartsThrown < 1 THEN throw ArgumentError', () {
      // Arrange
      final int dartsThrown = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsThrown: dartsThrown), throwsArgumentError);
    });
    test('GIVEN valid points, pointsLeft WHEN dartsThrown > 3 THEN throw ArgumentError', () {
      // Arrange
      final int dartsThrown = 4;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsThrown: dartsThrown), throwsArgumentError);
    });
    test('GIVEN valid points, pointsLeft WHEN dartsOnDouble < 0 THEN throw ArgumentError', () {
      // Arrange
      final int dartsOnDouble = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsOnDouble: dartsOnDouble), throwsArgumentError);
    });
    test('GIVEN valid points, pointsLeft WHEN dartsOnDouble > 3 THEN throw ArgumentError', () {
      // Arrange
      final int dartsOnDouble = 4;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsOnDouble: dartsOnDouble), throwsArgumentError);
    });

    test('GIVEN valid points, pointsLeft WHEN points > pointsLeft THEN return false', () {
      // Arrange
      final int points = 120;
      final int pointsLeft = 100;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(points, pointsLeft), false);
    });
    // TODO

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
