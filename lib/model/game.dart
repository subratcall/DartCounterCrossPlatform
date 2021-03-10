import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/model/set.dart';

enum GameStatus { PENDING, RUNNING, FINISHED }
enum GameMode { BEST_OF, FIRST_TO }
enum GameType { LEGS, SETS }

class Game {

  DateTime date;

  GameStatus status;
  GameMode mode;
  GameType type;
  int size;
  int startingPoints;

  List<Player> players;

  Game(this.date, this.status, this.mode, this.type, this.size, this.startingPoints, this.players);

  Game.dummy({
    this.status = GameStatus.PENDING,
    this.mode = GameMode.BEST_OF,
    this.type = GameType.SETS,
    this.size = 7,
    this.startingPoints = 501,
  }) : date = DateTime.now(),
        players = [Player.dummy(name: 'Larry'), Player.dummy(name: 'Jeffry')];

  Game.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    status = json['status'];
    mode = json['mode'];
    type = json['type'];
    size = json['size'];
    startingPoints = json['startingPoints'];
    players = json['players'] != null ? json['players'].map((value) => Player.fromJson(value)).toList() : null;
  }

  Map<String, dynamic> toJson() => {
    'date' : date.toIso8601String(),
    'status' : status == GameStatus.RUNNING ? 'running' : status == GameStatus.PENDING ? 'pending' : 'finished',
    'mode' : mode == GameMode.FIRST_TO ? 'firstTo' : 'bestOf',
    'type' : type == GameType.LEGS ? 'legs' : 'sets',
    'size' : size,
    'startingPoints' : startingPoints,
    'players' : players != null ? players.map((player) => player.toJson()).toList() : null,
  };

  String get description {
    String modeString = mode == GameMode.FIRST_TO ? 'First to' : 'Best of';
    String typeString;
    if(type == GameType.LEGS) {
      if(size == 1) {
        typeString = 'Leg';
      } else {
        typeString = 'Legs';
      }
    } else {
      if(size == 1) {
        typeString = 'Set';
      } else {
        typeString = 'Sets';
      }
    }

    return modeString + ' ${size.toString()} ' + typeString;
  }

}
