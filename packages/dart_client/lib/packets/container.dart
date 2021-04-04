import 'package:dart_client/dart_client.dart';
import 'package:dart_client/packets/packet.dart';

class Container {
  int timestamp;
  String type;
  Packet payload;

  Container(this.type, this.payload) {
    timestamp = DateTime.now().millisecondsSinceEpoch;
  }

  Container.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    type = json['type'];
    payload = _payloadFromJsonString(json['payload']);
  }

  Map<String, dynamic> toJson() =>
      {'timestamp': timestamp, 'type': type, 'payload': payload};

  dynamic _payloadFromJsonString(json) {
    switch (type) {
      case 'snapshot':
        return SnapshotPacket.fromJson(json);
      case 'playerJoined':
        return PlayerJoinedPacket.fromJson(json);
      case 'playerExited':
        return PlayerExitedPacket.fromJson(json);
      case 'gameCanceled':
        return GameCanceledPacket.fromJson(json);
      default:
        throw Error(); // only happens if invalid packet was sent by server
    }
  }

  @override
  String toString() {
    return 'Container{timestamp: $timestamp, type: $type, payload: $payload}';
  }
}
