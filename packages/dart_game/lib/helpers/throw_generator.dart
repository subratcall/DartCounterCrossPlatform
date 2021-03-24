part of dart_game;

class ThrowGenerator {
  static Throw generate(DartBot bot, Game game) {
    if (bot.targetAverage == 0) return Throw(0);
    Random random = new Random();

    if (game.config.size == 301) {
      if (bot._dartsThrown < 3) {
        // first 3 darts
        return Throw(
            bot.targetAverage + random.nextInt(bot.targetAverage ~/ 5));
      }
    } else if (game.config.size == 501) {
      if (bot._dartsThrown < 6) {
        // first 6 darts
        return Throw(
            bot.targetAverage + random.nextInt(bot.targetAverage ~/ 5));
      }
    } else {
      if (bot._dartsThrown < 9) {
        // first 9 darts
        return Throw(
            bot.targetAverage + random.nextInt(bot.targetAverage ~/ 5));
      }
    }

    int score;
    if (bot._average < bot.targetAverage) {
      score = bot.targetAverage + random.nextInt(bot.targetAverage ~/ 5);
    } else {
      score = bot.targetAverage - random.nextInt(bot.targetAverage ~/ 5);
    }

    // TODO only return valid throw
    if (score >= bot.pointsLeft) {
      if (bot.pointsLeft >= 2 &&
          bot.pointsLeft < 170 &&
          ![159, 162, 163, 165, 166, 168, 169].contains(bot.pointsLeft)) {
        return Throw(bot.pointsLeft, dartsOnDouble: 1);
      } else {
        return generate(bot, game);
      }
    } else {
      if (bot.pointsLeft - score >= 2) {
        if (ThrowValidator.isValid(Throw(score), bot.pointsLeft)) {
          return Throw(score);
        } else {
          return generate(bot, game);
        }
      } else {
        if (bot.pointsLeft > 40) {
          return Throw(bot.pointsLeft - 40);
        } else if (bot.pointsLeft > 36) {
          return Throw(bot.pointsLeft - 36);
        } else if (bot.pointsLeft > 32) {
          return Throw(bot.pointsLeft - 32);
        } else if (bot.pointsLeft > 16) {
          return Throw(bot.pointsLeft - 16);
        } else if (bot._pointsLeft > 8) {
          return Throw(bot.pointsLeft - 8);
        } else if (bot.pointsLeft > 4) {
          return Throw(bot.pointsLeft - 4);
        } else if (bot.pointsLeft > 2) {
          return Throw(bot.pointsLeft - 2);
        }
      }
    }
    return Throw(0);
  }
}
