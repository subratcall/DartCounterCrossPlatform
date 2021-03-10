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

  String winner;

  List<Player> players;

  List<Set> sets;

  Game(this.date, this.status, this.mode, this.type, this.size, this.startingPoints, this.winner,
      this.players, this.sets);

  Game.dummy({
    this.status = GameStatus.PENDING,
    this.mode = GameMode.BEST_OF,
    this.type = GameType.SETS,
    this.size = 7,
    this.startingPoints = 501,
    this.winner,
  }) : date = DateTime.now(),
        players = [Player.dummy(name: 'Larry'), Player.dummy(name: 'Jeffry')],
        sets =[Set.dummy(),Set.dummy()];

  Game.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    status = json['status'];
    mode = json['mode'];
    type = json['type'];
    size = json['size'];
    startingPoints = json['startingPoints'];
    winner = json['winner'];
    players = json['players'] != null ? json['players'].map((value) => Player.fromJson(value)).toList() : null;
    sets = json['sets'] != null ? json['sets'].map((value) => Set.fromJson(value)).toList() : null;
  }

  Map<String, dynamic> toJson() => {
    'date' : date.toIso8601String(),
    'status' : status == GameStatus.RUNNING ? 'running' : status == GameStatus.PENDING ? 'pending' : 'finished',
    'mode' : mode == GameMode.FIRST_TO ? 'firstTo' : 'bestOf',
    'type' : type == GameType.LEGS ? 'legs' : 'sets',
    'size' : size,
    'startingPoints' : startingPoints,
    'winner' : winner,
    'players' : players != null ? players.map((player) => player.toJson()).toList() : null,
    'sets' : sets != null ? sets.map((set) => set.toJson()).toList() : null,
  };

  // TODO
  String get description => 'TODO description';

}
