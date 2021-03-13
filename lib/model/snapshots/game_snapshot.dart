import 'package:dart_counter/api/playing/offline/model/mode.dart';
import 'package:dart_counter/api/playing/offline/model/status.dart';
import 'package:dart_counter/api/playing/offline/model/type.dart';
import 'package:dart_counter/model/snapshots/player_snapshot.dart';
import 'package:faker/faker.dart';

class GameSnapshot {

  Status status;
  Mode mode;
  Type type;
  int size;
  int startingPoints;

  List<PlayerSnapshot> players;

  GameSnapshot(this.status, this.mode, this.type, this.size, this.startingPoints, this.players);

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