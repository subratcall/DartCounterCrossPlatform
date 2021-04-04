part of dart_client;

class PlayerJoinedPacket extends ResponsePacket {
  final String username;

  PlayerJoinedPacket.fromJson(Map<String, dynamic> json)
      : username = json['username'];
}
