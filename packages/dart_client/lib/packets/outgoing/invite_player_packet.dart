part of dart_client;

class InvitePlayerPacket extends RequestPacket {
  final String uid;

  InvitePlayerPacket(this.uid);
}
