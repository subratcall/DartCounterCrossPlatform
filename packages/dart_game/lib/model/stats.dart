part of dart_game;

class Stats {
  final double average;
  final double checkoutPercentage;
  final double firstNineAverage;
  final int bestLegDartsThrown;
  final double bestLegAverage;
  final int worstLegDartsThrown;
  final double worstLegAverage;
  final double averageDartsPerLeg;
  final int highestFinish;
  final int fourtyPlus;
  final int sixtyPlus;
  final int eightyPlus;
  final int hundredPlus;
  final int hundredTwentyPlus;
  final int hundredFourtyPlus;
  final int hundredSixtyPlus;
  final int hundredEighty;

  Stats(
      {this.average = 0,
      this.checkoutPercentage = 0,
      this.firstNineAverage = 0,
      this.bestLegDartsThrown,
      this.bestLegAverage,
      this.worstLegDartsThrown,
      this.worstLegAverage,
      this.averageDartsPerLeg,
      this.highestFinish,
      this.fourtyPlus = 0,
      this.sixtyPlus = 0,
      this.eightyPlus = 0,
      this.hundredPlus = 0,
      this.hundredTwentyPlus = 0,
      this.hundredFourtyPlus = 0,
      this.hundredSixtyPlus = 0,
      this.hundredEighty = 0});

  @override
  String toString() {
    return 'Stats{average: $average, checkoutPercentage: $checkoutPercentage, firstNineAverage: $firstNineAverage, bestLegDartsThrown: $bestLegDartsThrown, bestLegAverage: $bestLegAverage, worstLegDartsThrown: $worstLegDartsThrown, worstLegAverage: $worstLegAverage, averageDartsPerLeg: $averageDartsPerLeg, highestFinish: $highestFinish, fourtyPlus: $fourtyPlus, sixtyPlus: $sixtyPlus, eightyPlus: $eightyPlus, hundredPlus: $hundredPlus, hundredTwentyPlus: $hundredTwentyPlus, hundredFourtyPlus: $hundredFourtyPlus, hundredSixtyPlus: $hundredSixtyPlus, hundredEighty: $hundredEighty}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stats &&
          runtimeType == other.runtimeType &&
          average == other.average &&
          checkoutPercentage == other.checkoutPercentage &&
          firstNineAverage == other.firstNineAverage &&
          bestLegDartsThrown == other.bestLegDartsThrown &&
          bestLegAverage == other.bestLegAverage &&
          worstLegDartsThrown == other.worstLegDartsThrown &&
          worstLegAverage == other.worstLegAverage &&
          averageDartsPerLeg == other.averageDartsPerLeg &&
          highestFinish == other.highestFinish &&
          fourtyPlus == other.fourtyPlus &&
          sixtyPlus == other.sixtyPlus &&
          eightyPlus == other.eightyPlus &&
          hundredPlus == other.hundredPlus &&
          hundredTwentyPlus == other.hundredTwentyPlus &&
          hundredFourtyPlus == other.hundredFourtyPlus &&
          hundredSixtyPlus == other.hundredSixtyPlus &&
          hundredEighty == other.hundredEighty;

  @override
  int get hashCode =>
      average.hashCode ^
      checkoutPercentage.hashCode ^
      firstNineAverage.hashCode ^
      bestLegDartsThrown.hashCode ^
      bestLegAverage.hashCode ^
      worstLegDartsThrown.hashCode ^
      worstLegAverage.hashCode ^
      averageDartsPerLeg.hashCode ^
      highestFinish.hashCode ^
      fourtyPlus.hashCode ^
      sixtyPlus.hashCode ^
      eightyPlus.hashCode ^
      hundredPlus.hashCode ^
      hundredTwentyPlus.hashCode ^
      hundredFourtyPlus.hashCode ^
      hundredSixtyPlus.hashCode ^
      hundredEighty.hashCode;
}
