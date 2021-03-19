import 'package:dart_counter/model/snapshots/player_snapshot.dart';
import 'package:dart_game/dart_game.dart';
import 'package:faker/faker.dart';

class GameSnapshot {

  Status status;
  Mode mode;
  Type type;
  int size;
  int startingPoints;

  List<PlayerSnapshot> players;

  String get description {
    return (mode == Mode.firstTo ? 'First to ' : 'Best of ') + size.toString() + (type == Type.legs ? ' leg' : ' set') + (size == 1 ? '' : 's');
  }

  GameSnapshot(this.status, this.mode, this.type, this.size, this.startingPoints, this.players);

  GameSnapshot.from(Game game) {
    status = game.status;
    mode = game.config.mode;
    type = game.config.type;
    size = game.config.size;
    startingPoints = game.config.startingPoints;
    players = [];
    for(Player player in game.players) {
      players.add(PlayerSnapshot.from(player));
    }
  }

  GameSnapshot.seed(this.status) {
    mode = faker.randomGenerator.element([Mode.firstTo, Mode.bestOf]);
    type = faker.randomGenerator.element([Type.legs, Type.sets]);
    size = faker.randomGenerator.integer(15, min: 1);
    startingPoints = faker.randomGenerator.element([301, 501, 701]);
    players = faker.randomGenerator.amount((i) => PlayerSnapshot.seed(i == 0), 5).cast<PlayerSnapshot>().toList();
  }

  GameSnapshot.fromJson(Map<String, dynamic> json) {
    status = json['status'] == 'pending' ? Status.pending : json['status'] == 'running' ? Status.running : Status.finished;
    mode = json['mode'] == 'firstTo' ? Mode.firstTo : Mode.bestOf;
    type = json['type'] == 'legs' ? Type.legs : Type.sets;
    size = json['size'];
    startingPoints = json['startingPoints'];
    players = json['players'] != null ? json['players'].map((value) => PlayerSnapshot.fromJson(value)).cast<PlayerSnapshot>().toList() : null;
  }

  PlayerSnapshot get currentTurn {
    for(PlayerSnapshot playerSnapshot in players) {
      if(playerSnapshot.currentTurn) {
        return playerSnapshot;
      }
    }
    return null;
  }

}