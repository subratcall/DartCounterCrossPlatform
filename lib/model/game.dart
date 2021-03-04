import 'dart:math';

class Game {

  DateTime date;
  String description;
  double average;
  double checkoutPercentage;
  bool won;

  Game(this.date, this.description, this.average, this.checkoutPercentage, this.won);

  Game.dummy() {
    date = DateTime.now();
    description = 'Best of 99 legs';
    average = 99.33;
    checkoutPercentage = 43.5;
    won = Random().nextBool();
  }

  Game.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    description = json['description'];
    average = json['average'];
    checkoutPercentage = json['checkoutPercentage'];
    won = json['won'];
  }

  Map<String, dynamic> toJson() => {
    'date' : date.toIso8601String(),
    'description' : description,
    'average' : average,
    'checkoutPercentage' : checkoutPercentage,
    'won' : won,
  };
}
