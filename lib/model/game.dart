class Game {

  DateTime date;
  String description;
  double average;
  double checkoutPercentage;
  bool won;

  Game(this.date, this.description, this.average, this.checkoutPercentage, this.won);

  Game.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    average = json['average'];
    checkoutPercentage = json['checkoutPercentage'];
    won = json['won'];
  }

  Map<String, dynamic> toJson() => {
    'date' : date,
    'description' : description,
    'average' : average,
    'checkoutPercentage' : checkoutPercentage,
    'won' : won,
  };
}
