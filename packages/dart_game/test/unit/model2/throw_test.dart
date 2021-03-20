import 'package:dart_game/test/lib.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('constructor', () {
    test('GIVEN valid points WHEN throw is created THEN dartsThrown = 3', () {
      // Arrange & Act
      final Throw t = Throw(100);

      // Assert
      expect(t.dartsThrown, 3);
    });
    test('GIVEN valid points WHEN throw is created THEN dartsThrown = 0', () {
      // Arrange & Act
      final Throw t = Throw(100);

      // Assert
      expect(t.dartsOnDouble, 0);
    });
  });
}
