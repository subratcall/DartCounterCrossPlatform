import 'package:dart_game/dart_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isOneDartFinish', () {
    test('GIVEN points < 0 WHEN isOneDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int lessThanZero = -1;

      // Act & Assert
      expect(() => ThrowValidator.isOneDartFinish(lessThanZero), throwsArgumentError);
    });
    test('GIVEN points = 0 WHEN isOneDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int zero = 0;

      // Act & Assert
      expect(() => ThrowValidator.isOneDartFinish(zero), throwsArgumentError);
    });
    test('GIVEN points = 1 WHEN isOneDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int one = 1;

      // Act & Assert
      expect(() => ThrowValidator.isOneDartFinish(one), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isOneDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int toLargeValue = 181;

      // Act & Assert
      expect(() => ThrowValidator.isOneDartFinish(toLargeValue), throwsArgumentError);
    });
    group('GIVEN points is one-dart-finish WHEN isOneDartFinish is called THEN return true', () {
      final List<int> oneDartFinishes = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50];

      // Arrange
      for(int oneDartFinish in oneDartFinishes) {
        test('$oneDartFinish -> true', () {
          // Act & Assert
          expect(ThrowValidator.isOneDartFinish(oneDartFinish), true);
        });
      }
    });
    group('GIVEN points is not one-dart-finish WHEN isOneDartFinish is called THEN return false', () {
      final List<int> oneDartFinishes = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,50];
      final List<int> notOneDartFinishes = List.generate(180, (index) => index+1);
      notOneDartFinishes.removeWhere((element) => oneDartFinishes.contains(element) || element == 1);

      // Arrange
      for(int notOneDartFinish in notOneDartFinishes) {
        test('$notOneDartFinish -> false', () {
          // Act & Assert
          expect(ThrowValidator.isOneDartFinish(notOneDartFinish), false);
        });
      }
    });
  });

  group('isTwoDartFinish', () {
    test('GIVEN points < 0 WHEN isTwoDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int lessThanZero = -1;

      // Act & Assert
      expect(() => ThrowValidator.isTwoDartFinish(lessThanZero), throwsArgumentError);
    });
    test('GIVEN points = 0 WHEN isTwoDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int zero = 0;

      // Act & Assert
      expect(() => ThrowValidator.isTwoDartFinish(zero), throwsArgumentError);
    });
    test('GIVEN points = 1 WHEN isTwoDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int one = 1;

      // Act & Assert
      expect(() => ThrowValidator.isTwoDartFinish(one), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isTwoDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int toLargeValue = 181;

      // Act & Assert
      expect(() => ThrowValidator.isTwoDartFinish(toLargeValue), throwsArgumentError);
    });
    group('GIVEN points is two-dart-finish WHEN isTwoDartFinish is called THEN return true', () {
      final List<int> twoDartFinishes = List.generate(110, (index) => index+1);
      twoDartFinishes.removeWhere((element) => [1, 99, 102, 103, 105, 106, 108, 109].contains(element));

      // Arrange
      for(int twoDartFinish in twoDartFinishes) {
        test('$twoDartFinish -> true', () {
          // Act & Assert
          expect(ThrowValidator.isTwoDartFinish(twoDartFinish), true);
        });
      }
    });
    group('GIVEN points is not two-dart-finish WHEN isTwoDartFinish is called THEN return false', () {
      final List<int> twoDartFinishes = List.generate(110, (index) => index+1);
      twoDartFinishes.removeWhere((element) => [1, 99, 102, 103, 105, 106, 108, 109].contains(element));
      final List<int> notTwoDartFinishes = List.generate(180, (index) => index+1);
      notTwoDartFinishes.removeWhere((element) => twoDartFinishes.contains(element) || element == 1);

      // Arrange
      for(int notTwoDartFinish in notTwoDartFinishes) {
        test('$notTwoDartFinish -> false', () {
          // Act & Assert
          expect(ThrowValidator.isTwoDartFinish(notTwoDartFinish), false);
        });
      }
    });
  });

  group('isThreeDartFinish', () {
    test('GIVEN points < 0 WHEN isThreeDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int lessThanZero = -1;

      // Act & Assert
      expect(() => ThrowValidator.isThreeDartFinish(lessThanZero), throwsArgumentError);
    });
    test('GIVEN points = 0 WHEN isThreeDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int zero = 0;

      // Act & Assert
      expect(() => ThrowValidator.isThreeDartFinish(zero), throwsArgumentError);
    });
    test('GIVEN points = 1 WHEN isThreeDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int one = 1;

      // Act & Assert
      expect(() => ThrowValidator.isThreeDartFinish(one), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isThreeDartFinish is called THEN throw ArgumentError', () {
      // Arrange
      final int toLargeValue = 181;

      // Act & Assert
      expect(() => ThrowValidator.isThreeDartFinish(toLargeValue), throwsArgumentError);
    });
    group('GIVEN points is three-dart-finish WHEN isThreeDartFinish is called THEN return true', () {
      final List<int> threeDartFinishes = List.generate(170, (index) => index+1);
      threeDartFinishes.removeWhere((element) => [1, 159, 162, 163, 165, 166, 168, 169].contains(element));

      // Arrange
      for(int threeDartFinish in threeDartFinishes) {
        test('$threeDartFinish -> true', () {
          // Act & Assert
          expect(ThrowValidator.isThreeDartFinish(threeDartFinish), true);
        });
      }
    });
    group('GIVEN points is not three-dart-finish WHEN isThreeDartFinish is called THEN return false', () {
      final List<int> threeDartFinishes = List.generate(170, (index) => index+1);
      threeDartFinishes.removeWhere((element) => [1, 159, 162, 163, 165, 166, 168, 169].contains(element));
      final List<int> notThreeDartFinishes = List.generate(180, (index) => index+1);
      notThreeDartFinishes.removeWhere((element) => threeDartFinishes.contains(element) || element == 1);

      // Arrange
      for(int notThreeDartFinish in notThreeDartFinishes) {
        test('$notThreeDartFinish -> false', () {
          // Act & Assert
          expect(ThrowValidator.isThreeDartFinish(notThreeDartFinish), false);
        });
      }
    });
  });

  group('isValidThrow', () {
    test('GIVEN points < 0 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int lessThanZero = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(lessThanZero, 501), throwsArgumentError);
    });
    test('GIVEN points > 180 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int toLargeValue = 181;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(toLargeValue, 501), throwsArgumentError);
    });
    test('GIVEN pointsLeft < 0 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int lessThanZero = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, lessThanZero), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 0 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int zero = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, zero), throwsArgumentError);
    });
    test('GIVEN pointsLeft = 1 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int one = 1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, one), throwsArgumentError);
    });
    test('GIVEN dartsThrown < 1 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int lessThanOne = 0;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsThrown: lessThanOne), throwsArgumentError);
    });
    test('GIVEN dartsThrown > 3 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int greaterThanThree = 4;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsThrown: greaterThanThree), throwsArgumentError);
    });
    test('GIVEN dartsOnDouble < 0 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int lessThanZero = -1;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsOnDouble: lessThanZero), throwsArgumentError);
    });
    test('GIVEN dartsOnDouble > 3 WHEN isValidThrow is called THEN throw ArgumentError', () {
      // Arrange
      final int greaterThanThree = 4;

      // Act & Assert
      expect(() => ThrowValidator.isValidThrow(60, 501, dartsOnDouble: greaterThanThree), throwsArgumentError);
    });

    test('GIVEN points = 0, dartsThrown != 3 WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int zero = 0;
      final int notEqualThree = 2;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(zero, 501, dartsThrown: notEqualThree), false);
    });
    test('GIVEN points > pointsLeft WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int points = 100;
      final int pointsLeft = 50;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(points, pointsLeft), false);
    });
    test('GIVEN points that can not be scored with 3 darts WHEN isValidThrow is called THEN return false', () {
      // Arrange
      // TODO

      // Act & Assert
      // TODO
    });
    test('GIVEN dartsOnDouble > dartsThrown WHEN isValidThrow is called THEN return false', () {
      // Arrange
      final int dartsOnDouble = 3;
      final int dartsThrown = 1;

      // Act & Assert
      expect(ThrowValidator.isValidThrow(60, 501, dartsThrown: dartsThrown, dartsOnDouble: dartsOnDouble), false);
    });
  });
}
