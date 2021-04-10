import 'package:dart_counter/model/player/player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/player_medium.dart';
import 'package:flutter/cupertino.dart';

class TwoPlayer extends StatelessWidget {
  final List<Player> players;

  TwoPlayer(this.players);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 178,
          child: PlayerMedium(
            players[0],
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(flex: 178, child: PlayerMedium(players[1])),
      ],
    );
  }
}
