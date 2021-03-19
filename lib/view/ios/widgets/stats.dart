import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/snapshots/player_snapshot.dart';
import 'package:dart_counter/view/ios/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Stats extends StatelessWidget {

  final List<PlayerSnapshot> players;

  Stats(this.players)
      : assert(players != null),
        assert(players.length > 0 && players.length <= 4);

  @override
  Widget build(BuildContext context) {
    if(players.length == 1) {
      return Row(
        children: [
          Expanded(
            flex: 180,
            child: DescriptionItem(),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 180,
            child:  PlayerItem(players[0]),
          ),
        ],
      );
    } else if(players.length == 2) {
      return Row(
        children: [
          Expanded(
            flex: 120,
            child: DescriptionItem(),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 120,
            child:  PlayerItem(players[0]),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 120,
            child: PlayerItem(players[1]),
          ),
        ],
      );
    } else if(players.length == 3) {
      return Row(
        children: [
          Expanded(
            flex: 90,
            child: DescriptionItem(),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 90,
            child:  PlayerItem(players[0]),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 90,
            child: PlayerItem(players[1]),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 90,
            child: PlayerItem(players[2]),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            flex: 72,
            child: DescriptionItem(),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 72,
            child:  PlayerItem(players[0]),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 72,
            child: PlayerItem(players[1]),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 72,
            child: PlayerItem(players[2]),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 72,
            child: PlayerItem(players[3]),
          ),
        ],
      );
    }
  }
}

class DescriptionItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 42,
      middle: AutoSizeText(
        AppLocalizations.of(context).category,
        maxLines: 1,
        style: TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.bold),
      ),
      flexBody: 458,
      body: Column(
        children: [
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).sets,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).legs,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).average,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).firstNine,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).bestLeg,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).worstLeg,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).checkoutPercentage,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).dartsPerLeg,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              AppLocalizations.of(context).highestFinish,
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '40+',
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '60+',
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '80+',
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '100+',
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '120+',
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '140+',
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '160+',
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '180',
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerItem extends StatelessWidget {

  final PlayerSnapshot player;

  PlayerItem(this.player);

  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 42,
      middle: AutoSizeText(
        player.name,
        maxLines: 1,
        minFontSize: 1,
        style: TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.bold),
      ),
      flexBody: 458,
      body: Column(
        children: [
          Expanded(
            child: AutoSizeText(
              player.sets.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.legs.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.average.toStringAsFixed(2),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.firstNineAverage.toStringAsFixed(2),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.bestLegAverage.toStringAsFixed(2),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.worstLegAverage.toStringAsFixed(2),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.checkoutPercentage.toStringAsFixed(2),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.averageDartsPerLeg.toStringAsFixed(2),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.highestFinish.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.fourtyPlus.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.sixtyPlus.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.eightyPlus.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.hundredPlus.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.hundredTwentyPlus.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.hundredFourtyPlus.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.hundredSixtyPlus.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              player.stats.hundredPlus.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}


