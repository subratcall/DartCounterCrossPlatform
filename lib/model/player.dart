import 'advanced_stats.dart';

class Player {
  String name;
  int legs;
  int sets;
  int pointsLeft;
  int lastThrow;
  List<String> finish;
  int dartsThrownThisLeg;
  double average;
  double checkoutPercentage;
  AdvancedStats advancedStats;

  Player(
      this.name,
      this.legs,
      this.sets,
      this.pointsLeft,
      this.lastThrow,
      this.finish,
      this.dartsThrownThisLeg,
      this.average,
      this.checkoutPercentage,
      this.advancedStats
      );

  Player.dummy({
    this.name = 'Larry',
    this.legs = 2,
    this.sets = 5,
    this.pointsLeft = 99,
    this.lastThrow = 121,
    this.finish = const ['T20', 'S7', 'D16'],
    this.dartsThrownThisLeg = 18,
    this.average = 56.93,
    this.checkoutPercentage = 27.67,
  }) : advancedStats = AdvancedStats.dummy();

  Player.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    legs = json['legs'];
    sets = json['sets'];
    pointsLeft = json['pointsLeft'];
    lastThrow = json['lastThrow'];
    finish = json['finish'] != null ? json['finish'].map((value) => value).toList() : null;
    dartsThrownThisLeg = json['dartsThrownThisLeg'];
    average = json['average'];
    checkoutPercentage = json['checkoutPercentage'];
    advancedStats = AdvancedStats.fromJson(json['advancedStats']);
  }

  Map<String, dynamic> toJson() => {
    'name' : name,
    'legs' : legs,
    'sets' : sets,
    'pointsLeft' : pointsLeft,
    'lastThrow' : lastThrow,
    'finish' : finish,
    'dartsThrownThisLeg' : dartsThrownThisLeg,
    'average' : average,
    'checkoutPercentage' : checkoutPercentage,
    'advancedStats' : advancedStats,
  };

}
