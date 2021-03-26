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

  Stats.fromJson(Map<String, dynamic> json)
      : average = json['average'],
        checkoutPercentage = json['checkoutPercentage'],
        firstNineAverage = json['firstNineAverage'],
        bestLegDartsThrown = json['bestLegDartsThrown'],
        bestLegAverage = json['bestLegAverage'],
        worstLegDartsThrown = json['worstLegDartsThrown'],
        worstLegAverage = json['worstLegAverage'],
        averageDartsPerLeg = json['averageDartsPerLeg'],
        highestFinish = json['highestFinish'],
        fourtyPlus = json['fourtyPlus'],
        sixtyPlus = json['sixtyPlus'],
        eightyPlus = json['eightyPlus'],
        hundredPlus = json['hundredPlus'],
        hundredTwentyPlus = json['hundredTwentyPlus'],
        hundredFourtyPlus = json['hundredFourtyPlus'],
        hundredSixtyPlus = json['hundredSixtyPlus'],
        hundredEighty = json['hundredEighty'];

  Map<String, dynamic> toJson() => {
        'average': average,
        'checkoutPercentage': checkoutPercentage,
        'firstNineAverage': firstNineAverage,
        'bestLegDartsThrown': bestLegDartsThrown,
        'bestLegAverage': bestLegAverage,
        'worstLegDartsThrown': worstLegDartsThrown,
        'worstLegAverage': worstLegAverage,
        'averageDartsPerLeg': averageDartsPerLeg,
        'highestFinish': highestFinish,
        'fourtyPlus': fourtyPlus,
        'sixtyPlus': sixtyPlus,
        'eightyPlus': eightyPlus,
        'hundredPlus': hundredPlus,
        'hundredTwentyPlus': hundredTwentyPlus,
        'hundredFourtyPlus': hundredFourtyPlus,
        'hundredSixtyPlus': hundredSixtyPlus,
        'hundredEighty': hundredEighty,
      };
}
