part of dart_game;

class Config {
  int startingPoints;
  Mode mode;
  int size;
  Type type;

  Config({this.startingPoints = 301, this.mode = Mode.firstTo, this.size = 1, this.type = Type.legs});

/*  Config.fromJson(Map<String, dynamic> json) {
    startingPoints = json['startingPoints'];
    mode = json['mode'] == 'firstTo' ? Mode.firstTo : Mode.bestOf;
    size = json['size'];
    type = json['type'] == 'legs' ? Type.legs : Type.sets;
  }

  Map<String, dynamic> toJson() => {
        'startingPoints': startingPoints,
        'mode': mode == Mode.firstTo ? 'firstTo' : 'bestOf',
        'size': size,
        'type': type == Type.legs ? 'legs' : 'sets',
      };*/

  @override
  String toString() {
    return 'GameConfig{startingPoints: $startingPoints, mode: $mode, size: $size, type: $type}';
  }
}
