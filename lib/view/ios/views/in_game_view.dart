import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/view/ios/views/checkout_details_view.dart';
import 'package:dart_counter/view/ios/views/in_game_stats_view.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_button.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_text_button.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/enum/key_type.dart';
import 'package:dart_counter/viewmodel/in_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<InGameViewModel>(
      builder: (context, model, child) => View(
          navigationBar: CupertinoNavigationBar(
            middle: Text(model.currentSnapshot.description),
            trailing: Builder(
              builder: (context) => CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.chart_bar_fill, size: 35),
                onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: AppColors.transparent,
                  builder: (context) => InGameStatsView(model.currentSnapshot),
                ),
              ),
            ),
          ),
          child: Builder(
            builder: (context) {
              Game game = model.currentSnapshot;
              return game != null ? Row(
                children: [
                  Spacer(
                    flex: 8,
                  ),
                  Expanded(
                    flex: 359,
                    child: Column(
                      children: [
                        Spacer(
                          flex: 4,
                        ),
                        Expanded(
                          flex: 318,
                          child: PlayerWrapper(game.players),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        Expanded(
                          flex: 64,
                          child: InputRow(
                            onUndoPressed: () => model.onUndoPressed(),
                            onPerformThrowPressed: () => model.onPerformThrowPressed(),
                            points: model.inputPoints,
                          ),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        Expanded(
                          flex: 289,
                          child: KeyBoard(
                            onKeyPressed: (key) => model.onKeyPressed(key),
                          ),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 8,
                  ),
                ],
              ) : LoadingView();
            }
          ),
      ),
    );
  }
}

class PlayerWrapper extends StatelessWidget {
  final List<Player> players;

  PlayerWrapper(this.players);

  @override
  Widget build(BuildContext context) {
    return players.length == 1 ? OnePlayer(players[0]) :
        players.length == 2 ? TwoPlayer(players) :
        players.length == 3 ? ThreePlayer(players) :
            FourPlayer(players);
  }
}

class OnePlayer extends StatelessWidget {
  
  final Player player;

  OnePlayer(this.player);

  @override
  Widget build(BuildContext context) {
    return PlayerBig(player);
  }
}

class TwoPlayer extends StatelessWidget {

  final List<Player> players;

  TwoPlayer(this.players);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 178,
          child: PlayerMedium(players[0]),
        ),
        Spacer(flex: 4,),
        Expanded(
          flex: 178,
          child: PlayerMedium(players[1]),
        )
      ],
    );
  }
}

class ThreePlayer extends StatelessWidget {

  final List<Player> players;

  ThreePlayer(this.players);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 178,
          child: PlayerMedium(players[0]),
        ),
        Spacer(flex: 4,),
        Expanded(
          flex: 178,
          child: Column(
            children: [
              Expanded(
                flex: 87,
                child: PlayerSmall(players[1]),
              ),
              Spacer(flex: 4,),
              Expanded(
                flex: 87,
                  child: PlayerSmall(players[2]),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FourPlayer extends StatelessWidget {

  final List<Player> players;

  FourPlayer(this.players);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 178,
          child: PlayerMedium(players[0]),
        ),
        Spacer(flex: 4,),
        Expanded(
          flex: 178,
          child: Column(
            children: [
              Expanded(
                flex: 57,
                  child: PlayerExtraSmall(players[1]),
              ),
              Spacer(flex: 4,),
              Expanded(
                flex: 57,
                child: PlayerExtraSmall(players[2]),
              ),
              Spacer(flex: 4,),
              Expanded(
                flex: 57,
                child: PlayerExtraSmall(players[3]),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PlayerBig extends StatelessWidget {

  final Player player;

  PlayerBig(this.player);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Container(
        color: player.isCurrentTurn ? AppColors.black2 : AppColors.black,
        child: Row(
          children: [
            Spacer(flex: 30),
            Expanded(
              flex: 298,
              child: Column(
                children: [
                  Spacer(flex: 17,),
                  Expanded(
                    flex: 25,
                    child: Row(
                      children: [
                        Spacer(flex: 70,),
                        Expanded(
                          flex: 218,
                          child: Center(
                            child: AutoSizeText(
                              player.name,
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 37,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 70,),
                      ],
                    ),
                  ),
                  Spacer(flex: 19,),
                  Expanded(
                    flex: 23,
                    child: Row(
                      children: [
                        Spacer(flex: 52),
                        Expanded(
                            flex: 60,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              child: Container(
                                color: AppColors.yellow,
                                child: Center(
                                  child: AutoSizeText(
                                    'S: ' + player.sets.toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                        Spacer(flex: 73),
                        Expanded(
                          flex: 60,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Container(
                              color: AppColors.yellow,
                              child: Center(
                                child: AutoSizeText(
                                  'L: ' + player.wonLegsCurrentSet.toString(),
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 52),
                      ],
                    ),
                  ),
                  Spacer(flex: 26,),
                  Expanded(
                    flex: 65,
                    child: Row(
                      children: [
                        Spacer(flex:  70,),
                        Expanded(
                          flex: 158,
                          child: Center(
                            child: AutoSizeText(
                              player.pointsLeft.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex:  70,),
                      ],
                    ),
                  ),
                  Spacer(flex: 13,),
                  Expanded(
                    flex: 15,
                    child: Row(
                      children: [
                        Spacer(flex: 135,),
                        Expanded(
                          flex: 28,
                          child: Center(
                            child: AutoSizeText(
                              player.lastPoints.toString(),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 135,),
                      ],
                    ),
                  ),
                  Spacer(flex: 33,),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Spacer(flex: 55,),
                        Expanded(
                          flex: 190,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).dartsThrown + ' : ' + player.dartsThrownCurrentLeg.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 55,),
                      ],
                    ),
                  ),
                  Spacer(flex: 17,),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 135,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).average + ' : ' + player.stats.average.toStringAsFixed(2),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 28,),
                        Expanded(
                          flex: 135,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).checkoutPercentage + ' : ' + player.stats.checkoutPercentage.toStringAsFixed(2),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 33,),
                ],
              ),
            ),
            Spacer(flex: 30),
          ],
        ),
      ),
    );
  }
}

class PlayerMedium extends StatelessWidget {

  final Player player;

  PlayerMedium(this.player);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Container(
        color: player.isCurrentTurn ? AppColors.black2 : AppColors.black,
        child: Row(
          children: [
            Spacer(flex: 10),
            Expanded(
              flex: 158,
              child: Column(
                children: [
                  Spacer(flex: 12,),
                  Expanded(
                    flex: 25,
                    child: Row(
                      children: [
                        Spacer(flex: 29,),
                        Expanded(
                          flex: 100,
                          child: Center(
                            child: AutoSizeText(
                              player.name,
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 29,),
                      ],
                    ),
                  ),
                  Spacer(flex: 16,),
                  Expanded(
                    flex: 23,
                    child: Row(
                      children: [
                        Spacer(flex: 18),
                        Expanded(
                            flex: 47,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              child: Container(
                                color: AppColors.yellow,
                                child: Center(
                                  child: AutoSizeText(
                                    'S: ' + player.sets.toString(),
                                    maxLines: 1,
                                    minFontSize: 1,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                        Spacer(flex: 28),
                        Expanded(
                          flex: 47,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Container(
                              color: AppColors.yellow,
                              child: Center(
                                child: AutoSizeText(
                                  'L: ' + player.wonLegsCurrentSet.toString(),
                                  maxLines: 1,
                                  minFontSize: 1,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 18),
                      ],
                    ),
                  ),
                  Spacer(flex: 26,),
                  Expanded(
                    flex: 65,
                    child: Row(
                      children: [
                        Spacer(flex:  18,),
                        Expanded(
                          flex: 122,
                          child: Center(
                            child: AutoSizeText(
                              player.pointsLeft.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex:  18,),
                      ],
                    ),
                  ),
                  Spacer(flex: 18,),
                  Expanded(
                    flex: 15,
                    child: Row(
                      children: [
                        Spacer(flex: 68,),
                        Expanded(
                          flex: 22,
                          child: Center(
                            child: AutoSizeText(
                              player.lastPoints.toString(),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 68,),
                      ],
                    ),
                  ),
                  Spacer(flex: 35,),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 190,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).dartsThrown + ' : ' + player.dartsThrownCurrentLeg.toString(),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 11,),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 190,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).average + ' : ' + player.stats.average.toStringAsFixed(2),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 11,),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 190,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).checkoutPercentage + ' : ' + player.stats.checkoutPercentage.toStringAsFixed(2),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 46,),
                ],
              ),
            ),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}

class PlayerSmall extends StatelessWidget {

  final Player player;

  PlayerSmall(this.player);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Container(
        color: player.isCurrentTurn ? AppColors.black2 : AppColors.black,
        child: Row(
          children: [
            Spacer(flex: 8),
            Expanded(
              flex: 158,
              child: Column(
                children: [
                  Spacer(flex: 10,),
                  Expanded(
                    flex: 15,
                    child: Row(
                      children: [
                        Spacer(flex: 29,),
                        Expanded(
                          flex: 96,
                          child: Center(
                            child: AutoSizeText(
                              player.name,
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 29,),
                      ],
                    ),
                  ),
                  Spacer(flex: 13,),
                  Expanded(
                    flex: 13,
                    child: Row(
                      children: [
                        Spacer(flex: 29),
                        Expanded(
                            flex: 36,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              child: Container(
                                color: AppColors.yellow,
                                child: Center(
                                  child: AutoSizeText(
                                    'S: ' + player.sets.toString(),
                                    maxLines: 1,
                                    minFontSize: 1,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                        Spacer(flex: 24),
                        Expanded(
                          flex: 36,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Container(
                              color: AppColors.yellow,
                              child: Center(
                                child: AutoSizeText(
                                  'L: ' + player.wonLegsCurrentSet.toString(),
                                  maxLines: 1,
                                  minFontSize: 1,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 29),
                      ],
                    ),
                  ),
                  Spacer(flex: 14,),
                  Expanded(
                    flex: 24,
                    child: Row(
                      children: [
                        Spacer(flex:  46,),
                        Expanded(
                          flex: 62,
                          child: Center(
                            child: AutoSizeText(
                              player.pointsLeft.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 37,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex:  46,),
                      ],
                    ),
                  ),
                  Spacer(flex: 10,),
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        Spacer(flex: 70,),
                        Expanded(
                          flex: 14,
                          child: Center(
                            child: AutoSizeText(
                              player.lastPoints.toString(),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 70,),
                      ],
                    ),
                  ),
                  Spacer(flex: 14,),
                  Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        Spacer(flex: 25,),
                        Expanded(
                          flex: 104,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).dartsThrown + ' : ' + player.dartsThrownCurrentLeg.toString(),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 25,),
                      ],
                    ),
                  ),
                  Spacer(flex: 11,),
                  Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 67,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).average + ' : ' + player.stats.average.toStringAsFixed(2),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 20,),
                        Expanded(
                          flex: 67,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).checkoutPercentage + ' : ' + player.stats.checkoutPercentage.toStringAsFixed(2),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 6,),
                ],
              ),
            ),
            Spacer(flex: 8),
          ],
        ),
      ),
    );
  }
}

class PlayerExtraSmall extends StatelessWidget {

  final Player player;

  PlayerExtraSmall(this.player);

  @override
  Widget build(BuildContext context) {
    return PlayerSmall(player);
  }
}

class InputRow extends StatelessWidget {
  final VoidCallback onUndoPressed;
  final VoidCallback onPerformThrowPressed;
  final int points;

  InputRow({this.onUndoPressed, this.onPerformThrowPressed, this.points});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 104,
          child: CupertinoButton(
            color: AppColors.red,
            onPressed: () => onUndoPressed(),
            padding: EdgeInsets.zero,
            child: Center(child: Icon(CupertinoIcons.arrow_left, size: 35)),
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 146,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              color: AppColors.black2,
              child: Center(
                child: AutoSizeText(
                  points.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.white),
                ),
              ),
            ),
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 104,
          child: CupertinoButton(
            color: AppColors.green,
            onPressed: () => onPerformThrowPressed(),
            padding: EdgeInsets.zero,
            child: Center(child: Icon(CupertinoIcons.arrow_right, size: 35)),
          ),
        ),
      ],
    );
  }
}

class KeyBoard extends StatelessWidget {
  final Function(KeyType) onKeyPressed;

  KeyBoard({this.onKeyPressed}) : assert(onKeyPressed != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '1',
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.one),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '2',
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.two),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                    text: '3',
                    fontSize: 45,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    onPressed: () => onKeyPressed(KeyType.three)),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  text: '4',
                  fontSize: 45,
                  onPressed: () => onKeyPressed(KeyType.four),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  text: '5',
                  fontSize: 45,
                  onPressed: () => onKeyPressed(KeyType.five),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  text: '6',
                  fontSize: 45,
                  onPressed: () => onKeyPressed(KeyType.six),
                ),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '7',
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.seven),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '8',
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.eight),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '9',
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.nine),
                ),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 117,
                child: Builder(
                  builder: (context) => PrimaryTextButton(
                    text: 'Check',
                    fontSize: 45,
                    onPressed: () {
                      onKeyPressed(KeyType.check);
                      CupertinoScaffold.showCupertinoModalBottomSheet(
                        expand: true,
                        context: context,
                        backgroundColor: AppColors.transparent,
                        builder: (context) => CheckoutDetailsView(),
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '0',
                  fontSize: 45,
                  onPressed: () => onKeyPressed(KeyType.zero),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryButton(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.erase),
                  child: Icon(AppIcons.erase, size: 35),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}