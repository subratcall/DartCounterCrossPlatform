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


  CarrerStats(this.average, this.averageTrend, this.checkoutPercentage, this.checkoutPercentageTrend, this.firstNine, this.firstNineTrend,
      this.games, this.wins, this.defeats);

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
    'average' : average,
    'averageTrend' : averageTrend,
    'checkoutPercentage' : checkoutPercentage,
    'checkoutPercentageTrend' : checkoutPercentageTrend,
    'firstNine' : firstNine,
    'firstNineTrend' : firstNineTrend,
    'games' : games,
    'wins' : wins,
    'defeats' : defeats,
  };
}