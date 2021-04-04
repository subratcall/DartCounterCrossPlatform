part of dart_client;

class PlayerExitedPacket extends ResponsePacket {
  final String username;

  PlayerExitedPacket.fromJson(Map<String, dynamic> json)
      : username = json['username'];
}
