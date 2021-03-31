import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/player_big.dart';
import 'package:flutter/cupertino.dart';

class OnePlayer extends StatelessWidget {
  final Player player;

  OnePlayer(this.player);

  @override
  Widget build(BuildContext context) {
    return PlayerBig(player);
  }
}
