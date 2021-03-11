import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/model/snapshots/player_snapshot.dart';
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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<InGameViewModel>(
      builder: (context, model, child) => View(
          navigationBar: CupertinoNavigationBar(
            middle: Text('First to 5 Legs'),
            trailing: Builder(
              builder: (context) => CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.chart_bar_fill, size: 35),
                onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: AppColors.transparent,
                  builder: (context) => InGameStatsView(),
                ),
              ),
            ),
          ),
          child: StreamBuilder(
              stream: model.gameSnapshots,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  GameSnapshot game = snapshot.data;
                  return Row(
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
                              child: PlayerDisplayer(game.players),
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
                  );
                }
                return LoadingView();
              })),
    );
  }
}

class PlayerDisplayer extends StatelessWidget {
  final List<PlayerSnapshot> players;

  PlayerDisplayer(this.players);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8.0),
      ),
      child: Container(
        color: AppColors.black,
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
                              players[0].name,
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
                                  'S: ' + players[0].sets.toString(),
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
                                  'L: ' + players[0].legs.toString(),
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
                              players[0].pointsLeft.toString(),
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
                    flex: 10,
                    child: Row(
                      children: [
                        Spacer(flex: 135,),
                        Expanded(
                            flex: 28,
                            child: Center(
                              child: AutoSizeText(
                                players[0].lastThrow.toString(),
                                maxLines: 1,
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
                              AppLocalizations.of(context).dartsThrown + ' : ' + players[0].dartsThrownThisLeg.toString(),
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
                              AppLocalizations.of(context).average + ' : ' + players[0].average.toStringAsFixed(2),
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
                              AppLocalizations.of(context).checkoutPercentage + ' : ' + players[0].checkoutPercentage.toStringAsFixed(2),
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
            onPressed: () => onUndoPressed,
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
              color: AppColors.gray,
              child: Center(
                child: AutoSizeText(
                  points.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.black),
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
            onPressed: () {
              //onPerformThrowPressed();
              // TODO remove this line
              Navigator.pushNamed(context, AppRoutes.postGame);
            },
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
