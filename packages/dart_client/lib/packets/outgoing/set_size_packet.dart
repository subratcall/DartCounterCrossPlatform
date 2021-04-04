part of dart_client;

class SetSizePacket extends RequestPacket {
  final int size;

  SetSizePacket(this.size);
}
