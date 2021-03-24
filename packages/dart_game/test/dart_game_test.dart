import 'package:dart_game/dart_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('constructor', () {
    test('GIVEN nothing WHEN game is created THEN status = pending', () {
      // Arrange

      // Act
      final Game game = Game();

      // Assert
      expect(game.status, Status.pending);
    });

    test('GIVEN valid config WHEN game is created THEN players contains 1 player with id 0', () {
      // Arrange

      // Act
      final Game game = Game();

      // Assert
      expect(game.players.length, 1);
      expect(game.players[0].id, 0);
    });
  });

  group('addPlayer', () {
    test('GIVEN pending game with 1 players WHEN player is added THEN return true and add player with id 1',
            () {
          // Arrange
          final Game game = Game();

          // Act & Assert
          expect(game.addPlayer(), true);
          expect(game.players.length, 2);
          expect(game.players[1].id, 1);
        });

    test('GIVEN pending game with 1-4 players WHEN player is added THEN return true and add player', () {
      // Arrange
      final Game game = Game();

      // Act & Assert
      expect(game.addPlayer(), true);
      expect(game.players.length, 2);
    });

    test('GIVEN pending game with 4 players WHEN player is added THEN return false and do not add player',
            () {
          // Arrange
          final Game game = Game();
          game.addPlayer();
          game.addPlayer();
          game.addPlayer();

          // Act & Assert
          expect(game.addPlayer(), false);
          expect(game.players.length, 4);
        });

    test('GIVEN pending game with 4 players WHEN player is added THEN return false and do not add player',
            () {
          // Arrange
          final Game game = Game();
          game.addPlayer();
          game.addPlayer();
          game.addPlayer();

          // Act & Assert
          expect(game.addPlayer(), false);
          expect(game.players.length, 4);
        });

    test('GIVEN running game with 1-4 players WHEN player is added THEN return false and do not add player',
            () {
          // Arrange
          final Game game = Game();
          game.start();

          // Act & Assert
          expect(game.addPlayer(), false);
          expect(game.players.length, 1);
        });
  });

  group('removePlayer', () {
    test(
        'GIVEN pending game with 2-4 players and id that belongs to an existing player WHEN player is removed THEN remove player',
            () {
          // Arrange
          final Game game = Game();
          game.addPlayer();
          final int id = game.players[1].id;

          // Act
          game.removePlayer(id);

          // Assert
          expect(game.players.length, 1);
          expect(game.players.map((e) => e.id).toList().contains(id), false);
        });

    test(
        'GIVEN pending game with 1 player and id that belongs to an existing player WHEN player is removed THEN do not remove player',
            () {
          // Arrange
          final Game game = Game();
          final int id = game.players[0].id;

          // Act
          game.removePlayer(id);

          // Assert
          expect(game.players.length, 1);
          expect(game.players.map((e) => e.id).toList().contains(id), true);
        });

    test(
        'GIVEN pending game with 2-4 players and id that does not belongs to an existing player WHEN player is removed THEN do not remove player',
            () {
          // Arrange
          final Game game = Game();
          game.addPlayer();
          game.addPlayer();
          final int id = 9999999999;

          // Act
          game.removePlayer(id);

          // Assert
          expect(game.players.length, 3);
          List<int> ids = game.players.map((e) => e.id).toList();
          expect(ids.contains(game.players[0].id), true);
          expect(ids.contains(game.players[1].id), true);
          expect(ids.contains(game.players[2].id), true);
        });

    test(
        'GIVEN pending game with 1 player, id that belongs to the player and a dartBot WHEN player is removed THEN do not remove player',
            () {
          // Arrange
          final Game game = Game();
          final int id = game.players[0].id;
          game.addDartBot();

          // Act
          game.removePlayer(id);

          // Assert
          expect(game.players.length, 2);
          expect(game.players.map((e) => e.id).toList().contains(id), true);
        });

    test('GIVEN running game with 2-4 players WHEN player is removed THEN do not remove player', () {
      // Arrange
      final Game game = Game();
      game.addPlayer();
      game.start();

      final int id = game.players[0].id;

      // Act
      game.removePlayer(id);

      // Assert
      expect(game.players.length, 2);
      List<int> ids = game.players.map((e) => e.id).toList();
      expect(ids.contains(game.players[0].id), true);
      expect(ids.contains(game.players[1].id), true);
    });
  });

  group('addDartBot', () {
    test('GIVEN pending game without a dartBot WHEN dartBot is added THEN return true and add dartBot', () {
      // Arrange
      final Game game = Game();

      // Act & Assert
      expect(game.addDartBot(), true);
      expect(game.players.length, 2);
      expect(game.players[1] is DartBot, true);
    });

    test('GIVEN pending game with a dartBot WHEN dartBot is added THEN return false and do not add dartBot',
            () {
          // Arrange
          final Game game = Game();
          game.addDartBot();

          // Act & Assert
          expect(game.addDartBot(), false);
          expect(game.players.length, 2);
          expect(game.players[1] is DartBot, true);
        });

    test(
        'GIVEN pending game with 4 players and  WHEN dartBot is added THEN return false and do not add dartBot',
            () {
          // Arrange
          final Game game = Game();
          game.addPlayer();
          game.addPlayer();
          game.addPlayer();

          // Act & Assert
          expect(game.addDartBot(), false);
          expect(game.players.length, 4);
        });

    test('GIVEN running game WHEN dartBot is added THEN return false and do not add dartBot', () {
      // Arrange
      final Game game = Game();
      game.start();

      // Act & Assert
      expect(game.addDartBot(), false);
      expect(game.players.length, 1);
    });
  });

  group('setDartBotTargetAverage', () {
    test('GIVEN pending game with dartBot WHEN dartBotTargetAverage is set THEN set new targetAverage', () {
      // Arrange
      final Game game = Game();
      game.addDartBot();
      final DartBot dartBot = game.players[1];

      // Act
      game.setDartBotTargetAverage(120);

      // Assert
      expect(dartBot.targetAverage, 120);
    });

    test('GIVEN running game with dartBot WHEN dartBotTargetAverage is set THEN do nothing', () {
      // Arrange
      final Game game = Game();
      game.addDartBot();
      final DartBot dartBot = game.players[1];
      game.start();

      // Act
      game.setDartBotTargetAverage(120);

      // Assert
      expect(dartBot.targetAverage, 0);
    });
  });

  group('removeDartBot', () {
    test('GIVEN pending game with 1-3 players and a dartBot WHEN dartBot is removed THEN remove dartBot', () {
      // Arrange
      final Game game = Game();
      game.addDartBot();

      // Act
      game.removeDartBot();

      // Assert
      expect(game.players.length, 1);
    });
    test(
        'GIVEN running game with 1-3 players and a dartBot WHEN dartBot is removed THEN do not remove dartBot',
            () {
          // Arrange
          final Game game = Game();
          game.addDartBot();
          game.start();

          // Act
          game.removeDartBot();

          // Assert
          expect(game.players.length, 2);
        });
  });

  group('setStartingPoints', () {
    test('GIVEN pending game WHEN startingPoints are set THEN set new startingPoints', () {
      // Arrange
      final Game game = Game();

      // Act
      game.setStartingPoints(701);

      // Assert
      expect(game.config.startingPoints, 701);
    });

    test('GIVEN running game WHEN startingPoints are set THEN do nothing', () {
      // Arrange
      final Game game = Game();
      game.start();

      // Act
      game.setStartingPoints(701);

      // Assert
      expect(game.config.startingPoints, 301);
    });
  });

  group('setMode', () {
    test('GIVEN pending game with WHEN mode is set THEN set new mode', () {
      // Arrange
      final Game game = Game();

      // Act
      game.setMode(Mode.bestOf);

      // Assert
      expect(game.config.mode, Mode.bestOf);
    });

    test('GIVEN running game with WHEN mode is set THEN do nothing', () {
      // Arrange
      final Game game = Game();
      game.start();

      // Act
      game.setMode(Mode.bestOf);

      // Assert
      expect(game.config.mode, Mode.firstTo);
    });
  });

  group('setSize', () {
    test('GIVEN pending game WHEN size is set THEN set new size', () {
      // Arrange
      final Game game = Game();

      // Act
      game.setSize(10);

      // Assert
      expect(game.config.size, 10);
    });

    test('GIVEN running game WHEN size is set THEN do nothing', () {
      // Arrange
      final Game game = Game();
      game.start();

      // Act
      game.setSize(10);

      // Assert
      expect(game.config.size, 1);
    });
  });

  group('setType', () {
    test('GIVEN pending game with WHEN type is set THEN set new type', () {
      // Arrange
      final Game game = Game();

      // Act
      game.setType(Type.sets);

      // Assert
      expect(game.config.type, Type.sets);
    });

    test('GIVEN running game with WHEN type is set THEN do nothing', () {
      // Arrange
      final Game game = Game();
      game.start();

      // Act
      game.setType(Type.sets);

      // Assert
      expect(game.config.type, Type.legs);
    });
  });

  group('start', () {
    test('GIVEN game with status = pending WHEN start is called THEN status = running', () {
      // Arrange
      final Game game = Game();

      // Act
      game.start();

      // Assert
      expect(game.status, Status.running);
    });
  });

  group('performThrow', () {
    group('1 Player', () {
      group('firstTo', () {
        group('1', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              Player player = game.players[0];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(121, dartsOnDouble: 1));

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 1,
                      hundredEighty: 1));
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              Player player = game.players[0];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(141, dartsOnDouble: 1));

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 1,
                      hundredEighty: 2));
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              Player player = game.players[0];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(161, dartsOnDouble: 1));

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 1,
                      hundredEighty: 3));
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-3
              for (int i = 0; i < 3; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(121, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 3,
                      hundredEighty: 3));
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-3
              for (int i = 0; i < 3; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(141, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 3,
                      hundredEighty: 6));
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-3
              for (int i = 0; i < 3; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(161, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 3,
                      hundredEighty: 9));
            });
          });
        });
        group('2+', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setSize(2);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(121, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 2,
                      hundredEighty: 2));
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setSize(2);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(141, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 2,
                      hundredEighty: 4));
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setSize(2);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(161, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 2,
                      hundredEighty: 6));
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setSize(2);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 6,
                      hundredEighty: 6));
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setSize(2);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 6,
                      hundredEighty: 12));
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setSize(2);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 6,
                      hundredEighty: 18));
            });
          });
        });
      });
      group('bestOf', () {
        group('1', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              Player player = game.players[0];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(121, dartsOnDouble: 1));

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 1,
                      hundredEighty: 1));
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              Player player = game.players[0];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(141, dartsOnDouble: 1));

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 1,
                      hundredEighty: 2));
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              Player player = game.players[0];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(161, dartsOnDouble: 1));

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 1,
                      hundredEighty: 3));
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-3
              for (int i = 0; i < 3; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(121, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 3,
                      hundredEighty: 3));
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-3
              for (int i = 0; i < 3; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(141, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 3,
                      hundredEighty: 6));
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-3
              for (int i = 0; i < 3; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(161, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 3,
                      hundredEighty: 9));
            });
          });
        });
        group('2+', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(121, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 2,
                      hundredEighty: 2));
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(141, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 2,
                      hundredEighty: 4));
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              Player player = game.players[0];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(180));
                game.performThrow(Throw(161, dartsOnDouble: 1));
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 2,
                      hundredEighty: 6));
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 6,
                      hundredEighty: 6));
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 6,
                      hundredEighty: 12));
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              Player player = game.players[0];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 6,
                      hundredEighty: 18));
            });
          });
        });
      });
    });

    group('2+ Player', () {
      group('firstTo', () {
        group('1', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(121, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 1,
                      hundredEighty: 1));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 301);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 3);
              expect(player1.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(141, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 1,
                      hundredEighty: 2));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 501);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 6);
              expect(player1.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(161, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 1,
                      hundredEighty: 3));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 701);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 9);
              expect(player1.stats, Stats());
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 3,
                      hundredEighty: 3));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 301);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 3);
              expect(player1.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 3,
                      hundredEighty: 6));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 501);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 6);
              expect(player1.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 3,
                      hundredEighty: 9));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 701);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 9);
              expect(player1.stats, Stats());
            });
          });
        });
        group('2+', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setSize(2);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              /// Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 2,
                      hundredEighty: 2));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 301);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 6);
              expect(player1.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setSize(2);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      fourtyPlus: 0,
                      sixtyPlus: 0,
                      eightyPlus: 0,
                      hundredPlus: 0,
                      hundredTwentyPlus: 0,
                      hundredFourtyPlus: 2,
                      hundredSixtyPlus: 0,
                      hundredEighty: 4));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 501);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 9);
              expect(player1.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setSize(2);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 2,
                      hundredEighty: 6));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 701);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 12);
              expect(player1.stats, Stats());
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setSize(2);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(121, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(121, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      fourtyPlus: 0,
                      sixtyPlus: 0,
                      eightyPlus: 0,
                      hundredPlus: 0,
                      hundredTwentyPlus: 6,
                      hundredFourtyPlus: 0,
                      hundredSixtyPlus: 0,
                      hundredEighty: 6));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 301);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 6);
              expect(player1.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setSize(2);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(141, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(141, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      fourtyPlus: 0,
                      sixtyPlus: 0,
                      eightyPlus: 0,
                      hundredPlus: 0,
                      hundredTwentyPlus: 0,
                      hundredFourtyPlus: 6,
                      hundredSixtyPlus: 0,
                      hundredEighty: 12));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 501);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 9);
              expect(player1.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setSize(2);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(161, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(161, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      fourtyPlus: 0,
                      sixtyPlus: 0,
                      eightyPlus: 0,
                      hundredPlus: 0,
                      hundredTwentyPlus: 0,
                      hundredFourtyPlus: 0,
                      hundredSixtyPlus: 6,
                      hundredEighty: 18));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 701);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 12);
              expect(player1.stats, Stats());
            });
          });
        });
      });
      group('bestOf', () {
        group('1', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(121, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 1,
                      hundredEighty: 1));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 301);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 3);
              expect(player1.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(141, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 1,
                      hundredEighty: 2));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 501);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 6);
              expect(player1.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(180));
              game.performThrow(Throw(0));
              game.performThrow(Throw(161, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 1,
                      hundredEighty: 3));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 701);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 9);
              expect(player1.stats, Stats());
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 3,
                      hundredEighty: 3));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 301);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 3);
              expect(player1.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 3,
                      hundredEighty: 6));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 501);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 6);
              expect(player1.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 3,
                      hundredEighty: 9));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 701);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 9);
              expect(player1.stats, Stats());
            });
          });
        });
        group('2+', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 2,
                      hundredEighty: 2));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 301);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 6);
              expect(player1.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredTwentyPlus: 0,
                      hundredFourtyPlus: 2,
                      hundredEighty: 4));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 501);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 9);
              expect(player1.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(0));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 2,
                      hundredEighty: 6));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, null);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 701);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 12);
              expect(player1.stats, Stats());
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(121, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(121, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 6,
                      hundredEighty: 6));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 301);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 6);
              expect(player1.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(141, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(141, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 6,
                      hundredEighty: 12));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 501);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 9);
              expect(player1.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              game.addPlayer();
              Player player = game.players[0];
              Player player1 = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(161, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(0));
                    game.performThrow(Throw(161, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 6,
                      hundredEighty: 18));
              // Player 1
              expect(player1.won, false);
              expect(player1.wonSets, 0);
              expect(player1.wonLegsCurrentSet, 0);
              expect(player1.pointsLeft, 701);
              expect(player1.lastPoints, 0);
              expect(player1.dartsThrownCurrentLeg, 12);
              expect(player1.stats, Stats());
            });
          });
        });
      });
    });

    group('1+ Player and DartBot', () {
      group('firstTo', () {
        group('1', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(121, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 1,
                      hundredEighty: 1));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 301);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 3);
              expect(dartBot.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(141, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 1,
                      hundredEighty: 2));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 501);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 6);
              expect(dartBot.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(161, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 1,
                      hundredEighty: 3));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 701);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 9);
              expect(dartBot.stats, Stats());
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 3,
                      hundredEighty: 3));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 301);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 3);
              expect(dartBot.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 3,
                      hundredEighty: 6));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 501);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 6);
              expect(dartBot.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 3,
                      hundredEighty: 9));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 701);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 9);
              expect(dartBot.stats, Stats());
            });
          });
        });
        group('2+', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setSize(2);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              /// Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 2,
                      hundredEighty: 2));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 301);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 6);
              expect(dartBot.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setSize(2);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      fourtyPlus: 0,
                      sixtyPlus: 0,
                      eightyPlus: 0,
                      hundredPlus: 0,
                      hundredTwentyPlus: 0,
                      hundredFourtyPlus: 2,
                      hundredSixtyPlus: 0,
                      hundredEighty: 4));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 501);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 9);
              expect(dartBot.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setSize(2);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 2,
                      hundredEighty: 6));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 701);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 12);
              expect(dartBot.stats, Stats());
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setSize(2);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(121, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(121, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      fourtyPlus: 0,
                      sixtyPlus: 0,
                      eightyPlus: 0,
                      hundredPlus: 0,
                      hundredTwentyPlus: 6,
                      hundredFourtyPlus: 0,
                      hundredSixtyPlus: 0,
                      hundredEighty: 6));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 301);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 6);
              expect(dartBot.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setSize(2);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(141, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(141, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      fourtyPlus: 0,
                      sixtyPlus: 0,
                      eightyPlus: 0,
                      hundredPlus: 0,
                      hundredTwentyPlus: 0,
                      hundredFourtyPlus: 6,
                      hundredSixtyPlus: 0,
                      hundredEighty: 12));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 501);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 9);
              expect(dartBot.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setSize(2);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(161, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(161, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      fourtyPlus: 0,
                      sixtyPlus: 0,
                      eightyPlus: 0,
                      hundredPlus: 0,
                      hundredTwentyPlus: 0,
                      hundredFourtyPlus: 0,
                      hundredSixtyPlus: 6,
                      hundredEighty: 18));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 701);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 12);
              expect(dartBot.stats, Stats());
            });
          });
        });
      });
      group('bestOf', () {
        group('1', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(121, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 1,
                      hundredEighty: 1));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 301);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 3);
              expect(dartBot.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(141, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 1,
                      hundredEighty: 2));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 501);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 6);
              expect(dartBot.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(180));
              game.performThrow(Throw(161, dartsOnDouble: 1));

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 1);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 1,
                      hundredEighty: 3));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 701);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 9);
              expect(dartBot.stats, Stats());
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 3,
                      hundredEighty: 3));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 301);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 3);
              expect(dartBot.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 3,
                      hundredEighty: 6));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 501);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 6);
              expect(dartBot.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1 Leg 1-3
              for (int i = 0; i < 3; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 1);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 3,
                      hundredEighty: 9));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 701);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 9);
              expect(dartBot.stats, Stats());
            });
          });
        });
        group('2+', () {
          group('legs', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(121, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 2,
                      hundredEighty: 2));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 301);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 6);
              expect(dartBot.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(141, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredTwentyPlus: 0,
                      hundredFourtyPlus: 2,
                      hundredEighty: 4));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 501);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 9);
              expect(dartBot.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Leg 1-2
              for (int i = 0; i < 2; i++) {
                if (i % 2 == 0) {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                } else {
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(180));
                  game.performThrow(Throw(161, dartsOnDouble: 1));
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, null);
              expect(player.wonLegsCurrentSet, 2);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 2,
                      hundredEighty: 6));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, null);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 701);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 12);
              expect(dartBot.stats, Stats());
            });
          });
          group('sets', () {
            test('301', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(301);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(121, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(121, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 121);
              expect(player.dartsThrownCurrentLeg, 6);
              expect(
                  player.stats,
                  Stats(
                      average: 150.5,
                      checkoutPercentage: 1,
                      firstNineAverage: 150.5,
                      bestLegDartsThrown: 6,
                      bestLegAverage: 150.5,
                      worstLegDartsThrown: 6,
                      worstLegAverage: 150.5,
                      averageDartsPerLeg: 6,
                      highestFinish: 121,
                      hundredTwentyPlus: 6,
                      hundredEighty: 6));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 301);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 6);
              expect(dartBot.stats, Stats());
            });
            test('501', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(501);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(141, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(141, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 141);
              expect(player.dartsThrownCurrentLeg, 9);
              expect(
                  player.stats,
                  Stats(
                      average: 167,
                      checkoutPercentage: 1,
                      firstNineAverage: 167,
                      bestLegDartsThrown: 9,
                      bestLegAverage: 167,
                      worstLegDartsThrown: 9,
                      worstLegAverage: 167,
                      averageDartsPerLeg: 9,
                      highestFinish: 141,
                      hundredFourtyPlus: 6,
                      hundredEighty: 12));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 501);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 9);
              expect(dartBot.stats, Stats());
            });
            test('701', () {
              // Arrange
              final Game game = Game();
              game.setStartingPoints(701);
              game.setMode(Mode.bestOf);
              game.setSize(3);
              game.setType(Type.sets);
              game.addDartBot();
              Player player = game.players[0];
              Player dartBot = game.players[1];

              // Act
              game.start();
              // Set 1-2
              for (int i = 0; i < 2; i++) {
                // Leg 1-3
                for (int j = 0; j < 3; j++) {
                  if (j % 2 == i % 2) {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(161, dartsOnDouble: 1));
                  } else {
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(180));
                    game.performThrow(Throw(161, dartsOnDouble: 1));
                  }
                }
              }

              // Assert
              // Player
              expect(player.won, true);
              expect(player.wonSets, 2);
              expect(player.wonLegsCurrentSet, 3);
              expect(player.pointsLeft, 0);
              expect(player.lastPoints, 161);
              expect(player.dartsThrownCurrentLeg, 12);
              expect(
                  player.stats,
                  Stats(
                      average: 175.25,
                      checkoutPercentage: 1,
                      firstNineAverage: 180,
                      bestLegDartsThrown: 12,
                      bestLegAverage: 175.25,
                      worstLegDartsThrown: 12,
                      worstLegAverage: 175.25,
                      averageDartsPerLeg: 12,
                      highestFinish: 161,
                      hundredSixtyPlus: 6,
                      hundredEighty: 18));
              // DartBot
              expect(dartBot.won, false);
              expect(dartBot.wonSets, 0);
              expect(dartBot.wonLegsCurrentSet, 0);
              expect(dartBot.pointsLeft, 701);
              expect(dartBot.lastPoints, 0);
              expect(dartBot.dartsThrownCurrentLeg, 12);
              expect(dartBot.stats, Stats());
            });
          });
        });
      });
    });
  });

  group('undoThrow', () {
    test('GIVEN running first to 3 sets game from 501 with 1 Players WHEN throw is undone but nobody threw yet THEN do noting', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.start();
      Player player = game.players[0];

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 2 Players WHEN throw is undone but nobody threw yet THEN do noting', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 3 Players WHEN throw is undone but nobody threw yet THEN do noting', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, null);
      expect(player2.dartsThrownCurrentLeg, 0);
      expect(player2.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 4 Players WHEN throw is undone but nobody threw yet THEN do noting', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      Player player3 = game.players[3];

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, null);
      expect(player2.dartsThrownCurrentLeg, 0);
      expect(player2.stats, Stats());
      // Player 3
      expect(player3.won, false);
      expect(player3.wonSets, 0);
      expect(player3.wonLegsCurrentSet, 0);
      expect(player3.pointsLeft, 501);
      expect(player3.lastPoints, null);
      expect(player3.dartsThrownCurrentLeg, 0);
      expect(player3.stats, Stats());
    });

    test('GIVEN running first to 3 sets game from 501 with 1 Players with 1st leg played perfectly by first player and now 2nd leg began but nobody threw yet WHEN throw is undone THEN jump back to 1st leg and undo the last throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.start();
      Player player = game.players[0];
      game.performThrow(Throw(180));
      game.performThrow(Throw(180));
      game.performThrow(Throw(141, dartsOnDouble: 1));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 141);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 180,
          checkoutPercentage: 0,
          firstNineAverage: 180,
          hundredEighty: 2)
      );
    });
    test('GIVEN running first to 3 sets game from 501 with 2 Players with 1st leg played perfectly by first player and now 2nd leg began but nobody threw yet WHEN throw is undone THEN jump back to 1st leg and undo the last throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 141);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 180,
          checkoutPercentage: 0,
          firstNineAverage: 180,
          hundredEighty: 2)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, 0);
      expect(player1.dartsThrownCurrentLeg, 6);
      expect(player1.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 3 Players with 1st leg played perfectly by first player and now 2nd leg began but nobody threw yet WHEN throw is undone THEN jump back to 1st leg and undo the last throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 141);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 180,
          checkoutPercentage: 0,
          firstNineAverage: 180,
          hundredEighty: 2)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, 0);
      expect(player1.dartsThrownCurrentLeg, 6);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, 0);
      expect(player2.dartsThrownCurrentLeg, 6);
      expect(player2.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 4 Players with 1st leg played perfectly by first player and now 2nd leg began but nobody threw yet WHEN throw is undone THEN jump back to 1st leg and undo the last throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      Player player3 = game.players[3];
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 141);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 180,
          checkoutPercentage: 0,
          firstNineAverage: 180,
          hundredEighty: 2)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, 0);
      expect(player1.dartsThrownCurrentLeg, 6);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, 0);
      expect(player2.dartsThrownCurrentLeg, 6);
      expect(player2.stats, Stats());
      // Player 3
      expect(player3.won, false);
      expect(player3.wonSets, 0);
      expect(player3.wonLegsCurrentSet, 0);
      expect(player3.pointsLeft, 501);
      expect(player3.lastPoints, 0);
      expect(player3.dartsThrownCurrentLeg, 6);
      expect(player3.stats, Stats());
    });

    test('GIVEN running first to 3 sets game from 501 with 1 Players with 1st set played perfectly by first player and now 2nd set began nobody threw yet WHEN throw is undone THEN jump back to 1st set and undo the last throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.start();
      Player player = game.players[0];
      // Set 1 Leg 1-3
      for(int i = 0; i<3; i++) {
        game.performThrow(Throw(180));
        game.performThrow(Throw(180));
        game.performThrow(Throw(141, dartsOnDouble: 1));
      }

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 2);
      expect(player.pointsLeft, 141);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 170.25,
          checkoutPercentage: 1,
          firstNineAverage: 170.25,
          bestLegDartsThrown: 9,
          bestLegAverage: 167,
          worstLegDartsThrown: 9,
          worstLegAverage: 167,
          averageDartsPerLeg: 9,
          highestFinish: 141,
          hundredFourtyPlus: 2,
          hundredEighty: 6)
      );
    });
    test('GIVEN running first to 3 sets game from 501 with 2 Players with 1st set played perfectly by first player and now 2nd set began but nobody threw yet WHEN throw is undone THEN jump back to 1st set and undo the last throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      // Set 1 Leg 1-3
      for(int i = 0; i<3; i++) {
        if(i % 2 == 0) {
          game.performThrow(Throw(180));
          game.performThrow(Throw(0));
          game.performThrow(Throw(180));
          game.performThrow(Throw(0));
          game.performThrow(Throw(141, dartsOnDouble: 1));
        } else {
          game.performThrow(Throw(0));
          game.performThrow(Throw(180));
          game.performThrow(Throw(0));
          game.performThrow(Throw(180));
          game.performThrow(Throw(0));
          game.performThrow(Throw(141, dartsOnDouble: 1));
        }
      }


      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 2);
      expect(player.pointsLeft, 141);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 170.25,
          checkoutPercentage: 1,
          firstNineAverage: 170.25,
          bestLegDartsThrown: 9,
          bestLegAverage: 167,
          worstLegDartsThrown: 9,
          worstLegAverage: 167,
          averageDartsPerLeg: 9,
          highestFinish: 141,
          hundredFourtyPlus: 2,
          hundredEighty: 6)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, 0);
      expect(player1.dartsThrownCurrentLeg, 6);
      expect(player1.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 3 Players with 1st set played perfectly by first player and now 2nd set began but nobody threw yet WHEN throw is undone THEN jump back to 1st set and undo the last throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      // Set 1 Leg 1
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));
      // Set 1 Leg 2
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));
      // Set 1 Leg 3
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 2);
      expect(player.pointsLeft, 141);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 170.25,
          checkoutPercentage: 1,
          firstNineAverage: 170.25,
          bestLegDartsThrown: 9,
          bestLegAverage: 167,
          worstLegDartsThrown: 9,
          worstLegAverage: 167,
          averageDartsPerLeg: 9,
          highestFinish: 141,
          hundredFourtyPlus: 2,
          hundredEighty: 6)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, 0);
      expect(player1.dartsThrownCurrentLeg, 6);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, 0);
      expect(player2.dartsThrownCurrentLeg, 9);
      expect(player2.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 4 Players with 1st set played perfectly by first player and now 2nd set began but nobody threw yet WHEN throw is undone THEN jump back to 1st set and undo the last throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      Player player3 = game.players[3];
      // Set 1 Leg 1
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));
      // Set 1 Leg 2
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));
      // Set 1 Leg 3
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(180));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(0));
      game.performThrow(Throw(141, dartsOnDouble: 1));

      // Act
      game.undoThrow();

      // Assert
      /// Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 2);
      expect(player.pointsLeft, 141);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 170.25,
          checkoutPercentage: 1,
          firstNineAverage: 170.25,
          bestLegDartsThrown: 9,
          bestLegAverage: 167,
          worstLegDartsThrown: 9,
          worstLegAverage: 167,
          averageDartsPerLeg: 9,
          highestFinish: 141,
          hundredFourtyPlus: 2,
          hundredEighty: 6)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, 0);
      expect(player1.dartsThrownCurrentLeg, 6);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, 0);
      expect(player2.dartsThrownCurrentLeg, 9);
      expect(player2.stats, Stats());
      // Player 3
      expect(player3.won, false);
      expect(player3.wonSets, 0);
      expect(player3.wonLegsCurrentSet, 0);
      expect(player3.pointsLeft, 501);
      expect(player3.lastPoints, 0);
      expect(player3.dartsThrownCurrentLeg, 9);
      expect(player3.stats, Stats());
    });

    test('GIVEN running first to 3 sets game from 501 with 1 Players WHEN throw is undone after 1 throw was done THEN undo throw', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.start();
      Player player = game.players[0];
      game.performThrow(Throw(180));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 2 Players WHEN throw is undone after 1 throw was done THEN undo throw', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      game.performThrow(Throw(180));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 3 Players WHEN throw is undone after 1 throw was done THEN undo throw', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      game.performThrow(Throw(180));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, null);
      expect(player2.dartsThrownCurrentLeg, 0);
      expect(player2.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 4 Players WHEN throw is undone after 1 throw was done THEN undo throw', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.addPlayer();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      Player player3 = game.players[3];
      game.performThrow(Throw(180));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, null);
      expect(player2.dartsThrownCurrentLeg, 0);
      expect(player2.stats, Stats());
      // Player 3
      expect(player3.won, false);
      expect(player3.wonSets, 0);
      expect(player3.wonLegsCurrentSet, 0);
      expect(player3.pointsLeft, 501);
      expect(player3.lastPoints, null);
      expect(player3.dartsThrownCurrentLeg, 0);
      expect(player3.stats, Stats());
    });

    test('GIVEN running first to 3 sets game from 501 with 1 Player and a dartBot WHEN throw is undone when nobody threw yet THEN do noting', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addDartBot();
      game.start();
      Player player = game.players[0];
      Player dartBot = game.players[1];

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 501);
      expect(dartBot.lastPoints, null);
      expect(dartBot.dartsThrownCurrentLeg, 0);
      expect(dartBot.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 2 Players and a dartBot WHEN throw is undone when nobody threw yet THEN do noting', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addDartBot();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player dartBot = game.players[2];

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
      // Player 2
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 501);
      expect(dartBot.lastPoints, null);
      expect(dartBot.dartsThrownCurrentLeg, 0);
      expect(dartBot.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 3 Players and a dartBot WHEN throw is undone when nobody threw yet THEN do noting', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.addDartBot();
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      Player dartBot = game.players[3];

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, null);
      expect(player2.dartsThrownCurrentLeg, 0);
      expect(player2.stats, Stats());
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 501);
      expect(dartBot.lastPoints, null);
      expect(dartBot.dartsThrownCurrentLeg, 0);
      expect(dartBot.stats, Stats());
    });

    test('GIVEN running first to 3 sets game from 501 with 1 Players and a dartBot with 1st leg played perfectly by dartBot and now 2nd leg began but nobody threw yet WHEN throw is undone THEN jump back to 1st leg and undo the last throw of dartBot and of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player dartBot = game.players[1];
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 301);
      expect(player.lastPoints, 100);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 2)
      );
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 141);
      expect(dartBot.lastPoints, 180);
      expect(dartBot.dartsThrownCurrentLeg, 6);
      expect(dartBot.stats, Stats(
          average: 180,
          checkoutPercentage: 0,
          firstNineAverage: 180,
          hundredEighty: 2)
      );
    });
    test('GIVEN running first to 3 sets game from 501 with 2 Players and a dartBot with 1st leg played perfectly by dartBot and now 2nd leg began but nobody threw yet WHEN throw is undone THEN jump back to 1st leg and undo the last throw of dartBot and of player 2', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player dartBot = game.players[2];
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 201);
      expect(player.lastPoints, 100);
      expect(player.dartsThrownCurrentLeg, 9);
      expect(player.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 3)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 301);
      expect(player1.lastPoints, 100);
      expect(player1.dartsThrownCurrentLeg, 6);
      expect(player1.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 2)
      );
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 141);
      expect(dartBot.lastPoints, 180);
      expect(dartBot.dartsThrownCurrentLeg, 6);
      expect(dartBot.stats, Stats(
          average: 180,
          checkoutPercentage: 0,
          firstNineAverage: 180,
          hundredEighty: 2)
      );
    });
    test('GIVEN running first to 3 sets game from 501 with 3 Players and a dartBot with 1st leg played perfectly by dartBot and now 2nd leg began but nobody threw yet WHEN throw is undone THEN jump back to 1st leg and undo the last throw of dartBot and of player 3', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      Player dartBot = game.players[3];
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 201);
      expect(player.lastPoints, 100);
      expect(player.dartsThrownCurrentLeg, 9);
      expect(player.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 3)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 201);
      expect(player1.lastPoints, 100);
      expect(player1.dartsThrownCurrentLeg, 9);
      expect(player1.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 3)
      );
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 301);
      expect(player2.lastPoints, 100);
      expect(player2.dartsThrownCurrentLeg, 6);
      expect(player2.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 2)
      );
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 141);
      expect(dartBot.lastPoints, 180);
      expect(dartBot.dartsThrownCurrentLeg, 6);
      expect(dartBot.stats, Stats(
          average: 180,
          checkoutPercentage: 0,
          firstNineAverage: 180,
          hundredEighty: 2)
      );
    });

    test('GIVEN running first to 3 sets game from 501 with 1 Players and a dartBot with 1st set played perfectly by dartBot and now 2nd set began but nobody threw yet WHEN throw is undone THEN jump back to 1st set and undo the last throw of dartBot and of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player dartBot = game.players[1];
      // Set 1 Leg 1
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      // Set 1 Leg 2
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      // Set 1 Leg 3
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 301);
      expect(player.lastPoints, 100);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 7)
      );
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 2);
      expect(dartBot.pointsLeft, 141);
      expect(dartBot.lastPoints, 180);
      expect(dartBot.dartsThrownCurrentLeg, 6);
      expect(dartBot.stats, Stats(
          average: 170.25,
          checkoutPercentage: 1,
          firstNineAverage: 170.25,
          bestLegDartsThrown: 9,
          bestLegAverage: 167,
          worstLegDartsThrown: 9,
          worstLegAverage: 167,
          averageDartsPerLeg: 9,
          highestFinish: 141,
          hundredFourtyPlus: 2,
          hundredEighty: 6)
      );
    });
    test('GIVEN running first to 3 sets game from 501 with 2 Players and a dartBot with 1st set played perfectly by dartBot and now 2nd set began but nobody threw yet WHEN throw is undone THEN jump back to 1st set and undo the last throw of dartBot and of player 2', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player dartBot = game.players[2];
      // Set 1 Leg 1
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      // Set 1 Leg 2
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      // Set 1 Leg 3
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 301);
      expect(player.lastPoints, 100);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 7)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 401);
      expect(player1.lastPoints, 100);
      expect(player1.dartsThrownCurrentLeg, 3);
      expect(player1.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 7)
      );
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 2);
      expect(dartBot.pointsLeft, 141);
      expect(dartBot.lastPoints, 180);
      expect(dartBot.dartsThrownCurrentLeg, 6);
      expect(dartBot.stats, Stats(
          average: 170.25,
          checkoutPercentage: 1,
          firstNineAverage: 170.25,
          bestLegDartsThrown: 9,
          bestLegAverage: 167,
          worstLegDartsThrown: 9,
          worstLegAverage: 167,
          averageDartsPerLeg: 9,
          highestFinish: 141,
          hundredFourtyPlus: 2,
          hundredEighty: 6)
      );
    });
    test('GIVEN running first to 3 sets game from 501 with 3 Players and a dartBot with 1st set played perfectly by dartBot and now 2nd set began but nobody threw yet WHEN throw is undone THEN jump back to 1st set and undo the last throw of dartBot and of player 3', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      Player dartBot = game.players[3];
      // Set 1 Leg 1
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      // Set 1 Leg 2
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      // Set 1 Leg 3
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      game.performThrow(Throw(100));
      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 301);
      expect(player.lastPoints, 100);
      expect(player.dartsThrownCurrentLeg, 6);
      expect(player.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 7)
      );
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 301);
      expect(player1.lastPoints, 100);
      expect(player1.dartsThrownCurrentLeg, 6);
      expect(player1.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 8)
      );
      // Player 2
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 301);
      expect(player2.lastPoints, 100);
      expect(player2.dartsThrownCurrentLeg, 6);
      expect(player2.stats, Stats(
          average: 100,
          checkoutPercentage: 0,
          firstNineAverage: 100,
          hundredPlus: 8)
      );
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 2);
      expect(dartBot.pointsLeft, 141);
      expect(dartBot.lastPoints, 180);
      expect(dartBot.dartsThrownCurrentLeg, 6);
      expect(dartBot.stats, Stats(
          average: 170.25,
          checkoutPercentage: 1,
          firstNineAverage: 170.25,
          bestLegDartsThrown: 9,
          bestLegAverage: 167,
          worstLegDartsThrown: 9,
          worstLegAverage: 167,
          averageDartsPerLeg: 9,
          highestFinish: 141,
          hundredFourtyPlus: 2,
          hundredEighty: 6)
      );
    });

    test('GIVEN running first to 3 sets game from 501 with 1 Player and a dartBot WHEN throw is undone after 1 throw of dartBot was done THEN undo dartBot throw and throw of player 1', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player dartBot = game.players[1];
      game.performThrow(Throw(180));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 501);
      expect(player.lastPoints, null);
      expect(player.dartsThrownCurrentLeg, 0);
      expect(player.stats, Stats());
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 501);
      expect(dartBot.lastPoints, null);
      expect(dartBot.dartsThrownCurrentLeg, 0);
      expect(dartBot.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 2 Players and a dartBot WHEN throw is undone after 1 throw of dartBot was done THEN undo dartBot throw and and throw of player 2', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player dartBot = game.players[2];
      game.performThrow(Throw(180));
      game.performThrow(Throw(180));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 321);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 3);
      expect(player.stats, Stats(
        average: 180,
        firstNineAverage: 180,
        hundredEighty: 1
      ));
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 501);
      expect(player1.lastPoints, null);
      expect(player1.dartsThrownCurrentLeg, 0);
      expect(player1.stats, Stats());
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 501);
      expect(dartBot.lastPoints, null);
      expect(dartBot.dartsThrownCurrentLeg, 0);
      expect(dartBot.stats, Stats());
    });
    test('GIVEN running first to 3 sets game from 501 with 3 Players and a dartBot WHEN throw is undone after 1 throw of dartBot was done THEN undo dartBot throw and and throw of player 3', () {
      // Arrange
      final Game game = Game();
      game.setSize(3);
      game.setType(Type.sets);
      game.setStartingPoints(501);
      game.addPlayer();
      game.addPlayer();
      game.addDartBot();
      game.setDartBotTargetAverage(180);
      game.start();
      Player player = game.players[0];
      Player player1 = game.players[1];
      Player player2 = game.players[2];
      Player dartBot = game.players[3];
      game.performThrow(Throw(180));
      game.performThrow(Throw(180));
      game.performThrow(Throw(180));

      // Act
      game.undoThrow();

      // Assert
      // Player
      expect(player.won, false);
      expect(player.wonSets, 0);
      expect(player.wonLegsCurrentSet, 0);
      expect(player.pointsLeft, 321);
      expect(player.lastPoints, 180);
      expect(player.dartsThrownCurrentLeg, 3);
      expect(player.stats, Stats(
          average: 180,
          firstNineAverage: 180,
          hundredEighty: 1
      ));
      // Player 1
      expect(player1.won, false);
      expect(player1.wonSets, 0);
      expect(player1.wonLegsCurrentSet, 0);
      expect(player1.pointsLeft, 321);
      expect(player1.lastPoints, 180);
      expect(player1.dartsThrownCurrentLeg, 3);
      expect(player1.stats, Stats(
          average: 180,
          firstNineAverage: 180,
          hundredEighty: 1
      ));
      // Player 1
      expect(player2.won, false);
      expect(player2.wonSets, 0);
      expect(player2.wonLegsCurrentSet, 0);
      expect(player2.pointsLeft, 501);
      expect(player2.lastPoints, null);
      expect(player2.dartsThrownCurrentLeg, 0);
      expect(player2.stats, Stats());
      // DartBot
      expect(dartBot.won, false);
      expect(dartBot.wonSets, 0);
      expect(dartBot.wonLegsCurrentSet, 0);
      expect(dartBot.pointsLeft, 501);
      expect(dartBot.lastPoints, null);
      expect(dartBot.dartsThrownCurrentLeg, 0);
      expect(dartBot.stats, Stats());
    });
  });

  test('realGameSimulation', () {
    // TODO
  });
}
