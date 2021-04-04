part of dart_client;

class JoinGamePacket extends RequestPacket {
  final int gameCode;

  JoinGamePacket(this.gameCode);
}
