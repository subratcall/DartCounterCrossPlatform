class CarrerStats {
  double average;
  String averageTrend;
  double checkoutPercentage;
  String checkoutPercentageTrend;
  double firstNine;
  String firstNineTrend;
  int games;
  int wins;
  int defeats;

  CarrerStats(
      {this.average = 0.0,
      this.averageTrend,
      this.checkoutPercentage = 0.0,
      this.checkoutPercentageTrend,
      this.firstNine = 0.0,
      this.firstNineTrend,
      this.games = 0,
      this.wins = 0,
      this.defeats = 0});

  CarrerStats.dummy() {
    average = 89.44;
    averageTrend = 'up';
    checkoutPercentage = 34.44;
    checkoutPercentageTrend = 'up';
    firstNine = 75.44;
    firstNineTrend = 'down';
    games = 143;
    wins = 100;
    defeats = 43;
  }

  CarrerStats.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    averageTrend = json['averageTrend'];
    checkoutPercentage = json['checkoutPercentage'];
    checkoutPercentageTrend = json['checkoutPercentageTrend'];
    firstNine = json['firstNine'];
    firstNineTrend = json['firstNineTrend'];
    games = json['games'];
    wins = json['wins'];
    defeats = json['defeats'];
  }

  Map<String, dynamic> toJson() => {
        'average': average,
        'averageTrend': averageTrend,
        'checkoutPercentage': checkoutPercentage,
        'checkoutPercentageTrend': checkoutPercentageTrend,
        'firstNine': firstNine,
        'firstNineTrend': firstNineTrend,
        'games': games,
        'wins': wins,
        'defeats': defeats,
      };
}
