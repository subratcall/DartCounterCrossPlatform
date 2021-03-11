import 'package:dart_counter/model/snapshots/player_snapshot.dart';
import 'package:faker/faker.dart';

enum Status { PENDING, RUNNING, FINISHED }
enum Mode { FIRST_TO, BEST_OF }
enum Type { LEGS, SETS }

class GameSnapshot {

  Status status;
  Mode mode;
  Type type;
  int size;
  int startingPoints;

  List<PlayerSnapshot> players;

  GameSnapshot(this.status, this.mode, this.type, this.size, this.startingPoints, this.players);

  GameSnapshot.seed(this.status) {
    mode = faker.randomGenerator.element([Mode.FIRST_TO, Mode.BEST_OF]);
    type = faker.randomGenerator.element([Type.LEGS, Type.SETS]);
    size = faker.randomGenerator.integer(15, min: 1);
    startingPoints = faker.randomGenerator.element([301, 501, 701]);
    players = faker.randomGenerator.amount((i) => PlayerSnapshot.seed(i == 0), 4).cast<PlayerSnapshot>().toList();
  }

  GameSnapshot.fromJson(Map<String, dynamic> json) {
    status = json['status'] == 'pending' ? Status.PENDING : json['status'] == 'running' ? Status.RUNNING : Status.FINISHED;
    mode = json['mode'] == 'firstTo' ? Mode.FIRST_TO : Mode.BEST_OF;
    type = json['type'] == 'legs' ? Type.LEGS : Type.SETS;
    size = json['size'];
    startingPoints = json['startingPoints'];
    players = json['players'] != null ? json['players'].map((value) => PlayerSnapshot.fromJson(value)).cast<PlayerSnapshot>().toList() : null;
  }

}