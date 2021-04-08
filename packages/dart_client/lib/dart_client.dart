library dart_client;

import 'package:dart_client/json/decoder.dart';
import 'package:dart_client/json/encoder.dart';
import 'package:dart_client/packets/incoming/response_packet.dart';
import 'package:dart_client/packets/outgoing/request_packet.dart';
import 'package:dart_client/web_socket_client.dart';

/// client
part 'client.dart';

/// enums
part 'enums/mode.dart';
part 'enums/type.dart';

/// ##### packets #####

/// incoming
part 'packets/incoming/player_exited_packet.dart';
part 'packets/incoming/player_joined_packet.dart';
part 'packets/incoming/snapshot_packet.dart';

/// outgoing
part 'packets/outgoing/cancel_game_packet.dart';
part 'packets/outgoing/create_game_packet.dart';
part 'packets/outgoing/invite_player_packet.dart';
part 'packets/outgoing/join_game_packet.dart';
part 'packets/outgoing/perform_throw_packet.dart';
part 'packets/outgoing/remove_player_packet.dart';
part 'packets/outgoing/reorder_player_packet.dart';
part 'packets/outgoing/set_mode_packet.dart';
part 'packets/outgoing/set_size_packet.dart';
part 'packets/outgoing/set_starting_points_packet.dart';
part 'packets/outgoing/set_type_packet.dart';
part 'packets/outgoing/start_game_packet.dart';
part 'packets/outgoing/undo_throw_packet.dart';
