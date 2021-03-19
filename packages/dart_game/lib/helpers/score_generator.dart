part of dart_game;

class ScoreGenerator {
  static int getScore(DartBot bot) {
    Random random = new Random();
    double avg = double.parse(bot.average);
    int pointsLeft = bot.pointsLeft;

    if (bot.dartsThrown < 9) {
      // am Anfang
      return bot.targetAverage + random.nextInt(bot.targetAverage ~/ 5);
    }

    int score;
    if (avg < bot.targetAverage) {
      score = bot.targetAverage + random.nextInt(bot.targetAverage ~/ 5);
    } else {
      score = bot.targetAverage - random.nextInt(bot.targetAverage ~/ 5);
    }

    if (score >= pointsLeft) {
      // TODO uncomment and instead of true in if
      /*ThrowValidator.canCheckWithThreeDartsThrown(pointsLeft)*/
      if (true) {
        return pointsLeft;
      } else {
        return getScore(bot);
      }
    } else {
      if (pointsLeft - score >= 2) {
        if (ThrowValidator.isValidThrow(score, pointsLeft)) {
          return score;
        } else {
          return getScore(bot);
        }
      } else {
        if (pointsLeft > 40) {
          return pointsLeft - 40;
        } else if (pointsLeft > 36) {
          return pointsLeft - 36;
        } else if (pointsLeft > 32) {
          return pointsLeft - 32;
        } else if (pointsLeft > 16) {
          return pointsLeft - 16;
        } else if (pointsLeft > 8) {
          return pointsLeft - 8;
        } else if (pointsLeft > 4) {
          return pointsLeft - 4;
        } else if (pointsLeft > 2) {
          return pointsLeft - 2;
        }
      }
    }

    /* if(game.getCurrentTurn().getPointsLeft() < targetAvg) {
      // höhere finish chance
      if(ThrowValidator.isValidFinish(game.getCurrentTurn().getPointsLeft())) {
        // finish zu 90 %
        int zufall = random.nextInt(10) + 1;
        if(zufall != 7) {
          return game.getCurrentTurn().getPointsLeft();
        }
      } else {
        // not finishable
        if(game.getCurrentTurn().getPointsLeft() >= 16) {
          // stelle 16
          return game.getCurrentTurn().getPointsLeft() - 16;
        } else {
          // stelle 8
          return game.getCurrentTurn().getPointsLeft() - 8;
        }
      }
    } else {
      if(!ThrowValidator.isValidThrow(score, game.getCurrentTurn().getPointsLeft())) {
        return getScore(game, targetAvg);
      } else {
        if(game.getCurrentTurn().getPointsLeft() == score) {
          if(!ThrowValidator.isValidFinish(score)) {
            return getScore(game, targetAvg);
          }
        }
      }
    }


    return score;
*/
  }

  static int getDartsNeededForFinish(Game game, targetAvg) {
    return 1;
  }
}
