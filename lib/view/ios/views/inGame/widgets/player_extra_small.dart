import 'package:dart_counter/model/offline_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/player_small.dart';
import 'package:flutter/cupertino.dart';

class PlayerExtraSmall extends StatelessWidget {
  final OfflinePlayer player;

  PlayerExtraSmall(this.player);

  @override
  Widget build(BuildContext context) {
    return PlayerSmall(player);
  }
}
