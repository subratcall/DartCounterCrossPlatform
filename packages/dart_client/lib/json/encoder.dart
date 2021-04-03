import 'dart:convert';

import 'package:dart_client/dart_client.dart';
import 'package:dart_client/packets/container.dart';
import 'package:dart_client/packets/outgoing/request_packet.dart';

class JsonEncoder {

  static String encode(RequestPacket packet) {
    String type;

    if(packet is CancelGamePacket) {
      type = 'cancelGame';
    } else if(packet is CreateGamePacket) {
      type = 'createGame';
    } else if(packet is InvitePlayerPacket) {
      type = 'invitePlayer';
    } else if(packet is PerformThrowPacket) {
      type = 'performThrow';
    } else if(packet is RemovePlayerPacket) {
      type = 'removePlayer';
    } else if(packet is ReorderPlayerPacket) {
      type = 'reorderPlayer';
    } else if(packet is SetModePacket) {
      type = 'setMode';
    } else if(packet is SetSizePacket) {
      type = 'setSize';
    } else if(packet is SetStartingPointsPacket) {
      type = 'setStartingPoints';
    } else if(packet is SetTypePacket) {
      type = 'setType';
    } else if(packet is StartGamePacket) {
      type = 'startGame';
    } else if(packet is UndoThrowPacket) {
      type = 'undoThrow';
    }

    if(type == null) throw Error(); // happens only if new packet type is not added to this method
    Container container = Container(type, packet);
    return jsonEncode(container);
  }
}