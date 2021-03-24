import 'package:dart_counter/model/player.dart';

enum Status { pending, running, finished }
enum Mode { firstTo, bestOf }
enum Type { legs, sets }

class Game {
  final DateTime date;

  final Status status;
  final Mode mode;
  final int size;
  final Type type;
  final int startingPoints;

  final List<Player> players;

  Game({this.date, this.status, this.mode, this.type, this.size, this.startingPoints, this.players});

  Game.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['date']),
        status = json['mode'] == 'pending' ? Status.pending : json['mode'] == 'running' ? Status.running : Status.finished,
        mode = json['mode'] == 'firstTo' ? Mode.firstTo : Mode.bestOf,
        type = json['type'] == 'legs' ? Type.legs : Type.sets,
        size = json['size'],
        startingPoints = json['startingPoints'],
        players = json['players'] != null ? json['players'].map((value) => Player.fromJson(value)).cast<Player>().toList() : null;

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'status': status == Status.running ? 'running' : status == Status.pending ? 'pending' : 'finished',
        'mode': mode == Mode.firstTo ? 'firstTo' : 'bestOf',
        'type': type == Type.legs ? 'legs' : 'sets',
        'size': size,
        'startingPoints': startingPoints,
        'players': players != null ? players.map((player) => player.toJson()).toList() : null,
      };

  String get description {
    String modeString = mode == Mode.firstTo ? 'First to' : 'Best of';
    String typeString;
    if (type == Type.legs) {
      if (size == 1) {
        typeString = 'Leg';
      } else {
        typeString = 'Legs';
      }
    } else {
      if (size == 1) {
        typeString = 'Set';
      } else {
        typeString = 'Sets';
      }
    }

    return modeString + ' ${size.toString()} ' + typeString;
  }
  
  Player get winner {
    if(status == Status.finished) {
      for(Player player in players) {
        if(player.won) {
          return player;
        }
      }
    }
    return null;
  }

  Player get currentTurn {
    for(Player player in players) {
      if(player.isCurrentTurn) {
        return player;
      }
    }
    return null;
  }
}
