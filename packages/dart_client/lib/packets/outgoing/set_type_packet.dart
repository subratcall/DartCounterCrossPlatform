part of dart_client;

class SetTypePacket extends RequestPacket {
  final Type type;

  SetTypePacket(this.type);
}
