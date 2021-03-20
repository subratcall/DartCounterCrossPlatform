part of dart_game;

class Set {

  final String id;
  List<Leg> legs;
  int legsNeededToWin;
  int startIndex;

  Set(this.startIndex, this.legsNeededToWin)
      :  id = Uuid().v4(),
        legs = [];

  /*Set.fromJson(Map<String, dynamic> json) {
    legs = json['legs'] != null ? json['legs'].map((value) => Leg.fromJson(value)).toList(): null;
    legsNeededToWin = json['legsNeededToWin'];
    startIndex = json['startIndex'];
  }

  Map<String, dynamic> toJson() => {
    'legs': legs,
    'legsNeededToWin': legsNeededToWin,
    'startIndex': startIndex
  };*/

  int get winner {
    List<int> winners = [];
    for (Leg leg in legs) {
      winners.add(leg.winner);
    }

    Map map = Map();
    winners.forEach((element) {
      if (!map.containsKey(element)) {
        map[element] = 1;
      } else {
        map[element] += 1;
      }
    });

    return map.keys.firstWhere((k) => map[k] == legsNeededToWin, orElse: () => -1);
  }

  @override
  String toString() {
    return 'Set{legs: $legs, legsNeededToWin: $legsNeededToWin, startIndex: $startIndex}';
  }

  @override
  bool operator ==(other) {
    Set o = other;
    return listEquals(this.legs, o.legs) &&
        this.legsNeededToWin == o.legsNeededToWin &&
        this.startIndex == o.startIndex;
  }
}
