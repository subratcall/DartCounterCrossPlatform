import 'package:dart_counter/model/snapshots/stats_snapshot.dart';
import 'package:faker/faker.dart';

class PlayerSnapshot {

  String name;
  bool currentTurn;
  int sets;
  int legs;
  int pointsLeft;
  int lastThrow;
  int dartsThrownThisLeg;
  double average;
  double checkoutPercentage;
  StatsSnapshot stats;

  PlayerSnapshot(this.name, this.sets, this.legs, this.pointsLeft, this.lastThrow, this.dartsThrownThisLeg,
      this.average, this.checkoutPercentage, this.stats);

  PlayerSnapshot.seed(this.currentTurn) {
    name = faker.internet.userName();
    sets = faker.randomGenerator.integer(4, min: -1);
    legs = sets == -1 ? faker.randomGenerator.integer(3, min: 0) : faker.randomGenerator.integer(15, min: 0);
    pointsLeft = faker.randomGenerator.integer(501, min: 2);
    lastThrow = faker.randomGenerator.integer(180, min: 0);
    dartsThrownThisLeg = faker.randomGenerator.integer(50, min: 0);
    average = faker.randomGenerator.decimal(scale: 100, min: 30);
    checkoutPercentage = faker.randomGenerator.decimal(scale: 100, min: 5);
    stats = StatsSnapshot.seed();
  }

  PlayerSnapshot.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    currentTurn = json['currentTurn'];
    legs = json['legs'];
    sets = json['sets'];
    pointsLeft = json['pointsLeft'];
    lastThrow = json['lastThrow'];
    dartsThrownThisLeg = json['dartsThrownThisLeg'];
    average = json['average'];
    checkoutPercentage = json['checkoutPercentage'];
    stats = json['stats'];
    stats = StatsSnapshot.fromJson(json['stats']);
  }
}