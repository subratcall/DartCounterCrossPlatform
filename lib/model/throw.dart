class Throw {
  final int points;
  final int dartsThrown;
  final int dartsOnDouble;

  Throw({this.points, this.dartsThrown = 3, this.dartsOnDouble = 0});

  Throw.fromJson(Map<String, dynamic> json)
      : points = json['points'],
        dartsThrown = json['dartsThrown'],
        dartsOnDouble = json['dartsOnDouble'];

  Map<String, dynamic> toJson() => {
        'points': points,
        'dartsThrown': dartsThrown,
        'dartsOnDouble': dartsOnDouble,
      };
}
