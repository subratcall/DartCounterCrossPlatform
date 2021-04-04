part of dart_client;

class ReorderPlayerPacket extends RequestPacket {
  final int oldIndex;
  final int newIndex;

  ReorderPlayerPacket(this.oldIndex, this.newIndex);
}
