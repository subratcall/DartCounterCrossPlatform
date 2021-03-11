import 'package:faker/faker.dart';

class StatsSnapshot {

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

  StatsSnapshot(
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
      this.hundredEighty);

  StatsSnapshot.seed() {
    firstNineAverage = faker.randomGenerator.decimal(scale: 100, min: 30);
    bestLegDarts = faker.randomGenerator.integer(30, min: 9);
    bestLegAverage = faker.randomGenerator.decimal(scale: 100, min: 60);
    worstLegDarts = faker.randomGenerator.integer(60, min: 30);
    worstLegAverage = faker.randomGenerator.decimal(scale: 60, min: 30);
    averageDartsPerLeg = faker.randomGenerator.decimal(scale: 50, min: 15);
    highestFinish = faker.randomGenerator.integer(170, min: 2);
    fourtyPlus = faker.randomGenerator.integer(20, min: 0);
    sixtyPlus = faker.randomGenerator.integer(18, min: 0);
    eightyPlus = faker.randomGenerator.integer(16, min: 0);
    hundredPlus = faker.randomGenerator.integer(14, min: 0);
    hundredTwentyPlus = faker.randomGenerator.integer(12, min: 0);
    hundredFourtyPlus = faker.randomGenerator.integer(10, min: 0);
    hundredSixtyPlus = faker.randomGenerator.integer(8, min: 0);
    hundredEighty = faker.randomGenerator.integer(6, min: 0);
  }

  StatsSnapshot.fromJson(Map<String, dynamic> json) {
    firstNineAverage = json['firstNineAverage'];
    bestLegDarts = json['bestLegDarts'];
    bestLegAverage = json['bestLegAverage'];
    worstLegDarts = json['worstLegDarts'];
    worstLegAverage = json['worstLegAverage'];
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