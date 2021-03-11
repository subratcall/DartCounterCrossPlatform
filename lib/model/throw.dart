class Throw {
  int points;
  int dartsThrown;
  int dartsOnDouble;

  Throw({this.points, this.dartsThrown = 3, this.dartsOnDouble = 0});

  Throw.dummy() {
    points = 180;
    dartsThrown = 3;
    dartsOnDouble = 0;
  }

  Throw.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    dartsThrown = json['dartsThrown'];
    dartsOnDouble = json['dartsOnDouble'];
  }

  Map<String, dynamic> toJson() => {
        'points': points,
        'dartsThrown': dartsThrown,
        'dartsOnDouble': dartsOnDouble,
      };
}
