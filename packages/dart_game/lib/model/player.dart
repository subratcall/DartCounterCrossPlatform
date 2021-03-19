part of dart_game;

class Player {

  String id;
  String name;
  bool isCurrentTurn;

  int lastThrow;
  int pointsLeft;
  int dartsThrown;

  int sets;
  int legs;

  double average;
  double checkoutPercentage;

  bool isWinner;

  Player([this.name = '']) : id = Uuid().v4();
/*
  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isNext = json['isNext'];
    lastThrow = json['lastThrow'];
    pointsLeft = json['pointsLeft'];
    dartsThrown = json['dartsThrown'];
    sets = json['sets'];
    legs = json['legs'];
    average = json['average'];
    checkoutPercentage = json['checkoutPercentage'];
    isWinner = json['isWinner'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isNext': isNext,
        'lastThrow': lastThrow,
        'pointsLeft': pointsLeft,
        'dartsThrown': dartsThrown,
        'sets': sets,
        'legs': legs,
        'average': average,
        'checkoutPercentage': checkoutPercentage,
        'isWinner': isWinner,
      };*/

  @override
  String toString() {
    return 'Player{id: $id, name: $name, lastThrow: $lastThrow, pointsLeft: $pointsLeft, dartsThrown: $dartsThrown, sets: $sets, legs: $legs, average: $average, checkoutPercentage: $checkoutPercentage, isWinner: $isWinner}';
  }

  @override
  bool operator ==(other) {
    Player o = other;
    return this.id == o.id;
  }
}
