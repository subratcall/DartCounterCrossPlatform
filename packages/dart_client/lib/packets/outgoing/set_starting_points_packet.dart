part of dart_client;

class SetStartingPointsPacket extends RequestPacket {
  final int startingPoints;

  SetStartingPointsPacket(this.startingPoints);
}
