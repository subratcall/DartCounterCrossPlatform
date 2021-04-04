part of dart_client;

class SetModePacket extends RequestPacket {
  final Mode mode;

  SetModePacket(this.mode);
}
