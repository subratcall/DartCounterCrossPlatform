// TODO time ago and descrip in diff language
// TODO make the widget responsive
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/offline_game.dart';
import 'package:dart_counter/view/ios/sharedWidgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

class GameHistoryCard extends StatelessWidget {
  final OfflineGame game;

  GameHistoryCard(this.game);

  @override
  Widget build(BuildContext context) {
    return Card(
      middle: AutoSizeText(
        game.description,
        maxLines: 1,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      trailing: AutoSizeText(
        timeago.format(game.date),
        maxLines: 1,
        style: TextStyle(fontSize: 9, color: AppColors.white),
      ),
      body: Row(
        children: [
          Expanded(
            child: Image.asset(
              // TODO read winner from game
              Random().nextBool() ? AppImages.win : AppImages.defeat,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    AutoSizeText(
                      AppLocalizations.of(context).average + ':',
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    AutoSizeText(
                      // TODO read owner average
                      'Average TODO',
                      //game.average.toString(),
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Spacer(),
                    AutoSizeText(
                      AppLocalizations.of(context).checkoutPercentage + ':',
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    AutoSizeText(
                      // TODO read owner Checkout%
                      'Checkout% TODO',
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
            flex: 4,
          ),
          Expanded(
            child: Icon(CupertinoIcons.chevron_forward),
          ),
        ],
      ),
    );
  }
}
