part of dart_game;

class Config {
  int startingPoints;
  Mode mode;
  int size;
  Type type;

  Config(
      {this.startingPoints = 301,
      this.mode = Mode.firstTo,
      this.size = 1,
      this.type = Type.legs});

  @override
  String toString() {
    return 'GameConfig{startingPoints: $startingPoints, mode: $mode, size: $size, type: $type}';
  }
}
