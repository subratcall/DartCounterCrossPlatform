part of dart_game;

class Config {
  int startingPoints;
  Mode mode;
  int size;
  Type type;

  Config() {
    startingPoints = 501;
    mode = Mode.firstTo;
    size = 1;
    type = Type.legs;
  }

  Config.fromJson(Map<String, dynamic> json) {
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
      };

  @override
  String toString() {
    return 'GameConfig{startingPoints: $startingPoints, mode: $mode, size: $size, type: $type}';
  }

  @override
  bool operator ==(other) {
    Config o = other as Config;
    return this.startingPoints == o.startingPoints &&
        this.mode == o.mode &&
        this.size == o.size &&
        this.type == o.type;
  }
}
