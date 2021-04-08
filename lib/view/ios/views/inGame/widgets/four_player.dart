import 'package:dart_counter/model/offline_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/player_extra_small.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/player_medium.dart';
import 'package:flutter/cupertino.dart';

class FourPlayer extends StatelessWidget {
  final List<OfflinePlayer> players;

  FourPlayer(this.players);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 178,
          child: PlayerMedium(players[0]),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 178,
          child: Column(
            children: [
              Expanded(
                flex: 57,
                child: PlayerExtraSmall(players[1]),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 57,
                child: PlayerExtraSmall(
                  players[2],
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 57,
                child: PlayerExtraSmall(
                  players[3],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
