class AdvancedStats {

  double firstNineAverage;
  int bestLegDarts;
  double bestLegAverage;
  int worstLegDarts;
  double worstLegAverage;
  double averageDartsPerLeg;
  int highestFinish;
  int fourtyPlus;
  int sixtyPlus;
  int eightyPlus;
  int hundredPlus;
  int hundredTwentyPlus;
  int hundredFourtyPlus;
  int hundredSixtyPlus;
  int hundredEighty;

  AdvancedStats(
      this.firstNineAverage,
      this.bestLegDarts,
      this.bestLegAverage,
      this.worstLegDarts,
      this.worstLegAverage,
      this.averageDartsPerLeg,
      this.highestFinish,
      this.fourtyPlus,
      this.sixtyPlus,
      this.eightyPlus,
      this.hundredPlus,
      this.hundredTwentyPlus,
      this.hundredFourtyPlus,
      this.hundredSixtyPlus,
      this.hundredEighty
      );

  AdvancedStats.dummy(
  {this.firstNineAverage = 56.5,
      this.bestLegDarts = 14,
      this.bestLegAverage = 107.51,
      this.worstLegDarts = 30,
      this.worstLegAverage = 50.1,
      this.averageDartsPerLeg = 26,
      this.highestFinish = 120,
      this.fourtyPlus = 10,
      this.sixtyPlus = 11,
      this.eightyPlus = 10,
      this.hundredPlus = 5,
      this.hundredTwentyPlus = 1,
      this.hundredFourtyPlus = 5,
      this.hundredSixtyPlus = 2,
      this.hundredEighty = 1}
      );

  AdvancedStats.fromJson(Map<String, dynamic> json) {
    firstNineAverage = json['firstNineAverage'];
    bestLegDarts = json['bestLegDarts'];
    bestLegAverage = json['bestLegAverage'];
    worstLegDarts = json['worstLegDarts'];
    averageDartsPerLeg = json['averageDartsPerLeg'];
    highestFinish = json['highestFinish'];
    fourtyPlus = json['fourtyPlus'];
    sixtyPlus = json['sixtyPlus'];
    eightyPlus = json['eightyPlus'];
    hundredPlus = json['hundredPlus'];
    hundredTwentyPlus = json['hundredTwentyPlus'];
    hundredFourtyPlus = json['hundredFourtyPlus'];
    hundredSixtyPlus = json['hundredSixtyPlus'];
    hundredEighty = json['hundredEighty'];
  }

}