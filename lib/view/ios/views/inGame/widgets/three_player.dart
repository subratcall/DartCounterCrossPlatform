import 'package:dart_counter/model/offline_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/player_medium.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/player_small.dart';
import 'package:flutter/cupertino.dart';

class ThreePlayer extends StatelessWidget {
  final List<OfflinePlayer> players;

  ThreePlayer(this.players);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 178,
            child: PlayerMedium(
              players[0],
            )),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 178,
          child: Column(
            children: [
              Expanded(
                  flex: 87,
                  child: PlayerSmall(
                    players[1],
                  )),
              Spacer(
                flex: 4,
              ),
              Expanded(
                  flex: 87,
                  child: PlayerSmall(
                    players[2],
                  )),
            ],
          ),
        )
      ],
    );
  }
}
