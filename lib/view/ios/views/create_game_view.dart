import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/action_button.dart';
import 'package:dart_counter/view/ios/widgets/card.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/create_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material, ListTile;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:reorderables/reorderables.dart';

class CreateGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateGameViewModel>(
      builder: (context, model, child) => View(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context).createGame),
        ),
        child: Builder(
          builder: (context) => model.currentSnapshot != null
              ? SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height +
                        model.currentSnapshot.players.length * 50 / 613 * MediaQuery.of(context).size.height,
                    child: Row(
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
                                flex: 115,
                                child: DartBotCard(
                                  onActiveChanged: (isActive) => model.onDartBotActiveChanged(isActive),
                                  onAverageChanged: (average) => model.onDartBotAverageChanged(average),
                                ),
                              ),
                              Spacer(
                                flex: 4,
                              ),
                              Expanded(
                                flex: 94 + model.currentSnapshot.players.length * 50,
                                child: PlayersCard(
                                  model.currentSnapshot.players,
                                  onAddPlayerPressed: model.onAddPlayerPressed,
                                  onRemovePlayer: model.onRemovePlayer,
                                ),
                              ),
                              Spacer(
                                flex: 4,
                              ),
                              Expanded(
                                flex: 281,
                                child: GameSettingsCard(
                                  onStartingPointsChanged: (startingPoints) => model.onStartingPointsChanged(startingPoints),
                                  onModeChanged: (mode) => model.onModeChanged(mode),
                                  onSizeChanged: (size) => model.onSizeChanged(size),
                                  onTypeChanged: (type) => model.onTypeChanged(type),
                                ),
                              ),
                              Spacer(
                                flex: 18,
                              ),
                              Expanded(
                                flex: 75,
                                child: ActionButton(
                                  text: AppLocalizations.of(context).startGame,
                                  onPressed: () {
                                    model.onStartGamePressed();
                                    Navigator.pushNamed(context, AppRoutes.inGame);
                                  },
                                ),
                              ),
                              Spacer(
                                flex: 18,
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 8,
                        ),
                      ],
                    ),
                  ),
                )
              : LoadingView(),
        ),
      ),
    );
  }
}

class DartBotCard extends StatefulWidget {
  final Function(bool) onActiveChanged;
  final Function(int) onAverageChanged;

  DartBotCard({this.onActiveChanged, this.onAverageChanged})
      : assert(onActiveChanged != null),
        assert(onAverageChanged != null);

  @override
  _DartBotCardState createState() => _DartBotCardState();
}

class _DartBotCardState extends State<DartBotCard> {
  bool show = false;
  double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
        AppLocalizations.of(context).dartbot,
        maxLines: 1,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      trailing: CupertinoSwitch(
        value: show,
        onChanged: (value) {
          widget.onActiveChanged(value);
          setState(() {
            show = !show;
          });
        },
      ),
      flexBody: show ? 71 : 0,
      body: Visibility(
        visible: show,
        child: Column(
          children: [
            Spacer(
              flex: 13,
            ),
            Expanded(
              flex: 20,
              child: Row(
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context).dartbotAverage,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 11,
            ),
            Expanded(
              flex: 30,
              child: Row(
                children: [
                  Expanded(
                    flex: 264,
                    child: CupertinoSlider(
                        min: 1,
                        max: 150,
                        activeColor: AppColors.green,
                        value: sliderValue,
                        onChangeEnd: (newValue) => widget.onAverageChanged(newValue.round()),
                        onChanged: (newValue) {
                          setState(() {
                            sliderValue = newValue;
                          });
                        }),
                  ),
                  Spacer(
                    flex: 15,
                  ),
                  Expanded(
                    flex: 35,
                    child: AutoSizeText(
                      sliderValue.round().toString(),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayersCard extends StatefulWidget {
  final List<Player> players;
  final VoidCallback onAddPlayerPressed;
  final Function(int) onRemovePlayer;

  PlayersCard(this.players, {this.onAddPlayerPressed, this.onRemovePlayer})
      : assert(onAddPlayerPressed != null),
        assert(onRemovePlayer != null);

  @override
  _PlayersCardState createState() => _PlayersCardState();
}

class _PlayersCardState extends State<PlayersCard> {
  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Player row = widget.players.removeAt(oldIndex);
        widget.players.insert(newIndex, row);
      });
    }

    ScrollController _scrollController = PrimaryScrollController.of(context) ?? ScrollController();

    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
          AppLocalizations.of(context).players,
        maxLines: 1,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      paddingBody: EdgeInsets.all(0.0),
      flexBody: 50 + widget.players.length * 50,
      body: Column(
        children: [
          Expanded(
            flex: widget.players.length,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                ReorderableSliverList(
                  delegate: ReorderableSliverChildBuilderDelegate(
                    (BuildContext context, int index) => PlayerItem(widget.players[index], onDismissed: widget.onRemovePlayer,),
                    childCount: widget.players.length,
                  ),
                  onReorder: _onReorder,
                )
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(
                flex: 49,
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                        child: AutoSizeText(
                          AppLocalizations.of(context).addPlayer,
                          maxLines: 1,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.green),
                        ),
                        onPressed: widget.onAddPlayerPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class PlayerItem extends StatelessWidget {
  final Player player;
  final Function(int) onDismissed;

  PlayerItem(this.player, {this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 50 / 613,
      child: Dismissible(
          key: ValueKey(player),
          onDismissed: (_) => onDismissed(player.id),
          background: Container(
            color: AppColors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    CupertinoIcons.delete,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          child: Column(
            children: [
              Spacer(
                flex: 10,
              ),
              Expanded(
                flex: 35,
                child: Row(
                  children: [
                    Spacer(
                      flex: 15,
                    ),
                    Expanded(
                      flex: 35,
                      child: Image.asset(AppImages.photoPlaceholder),
                    ),
                    Spacer(
                      flex: 46,
                    ),
                    Expanded(
                      flex: 167,
                      child: Center(
                        child: Text(
                          player.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 55,
                    ),
                    Expanded(
                      flex: 25,
                      child: Builder(
                        builder: (context) => CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Center(
                            child: Icon(
                              CupertinoIcons.ellipsis,
                              size: 35,
                            ),
                          ),
                          onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                            expand: false,
                            context: context,
                            backgroundColor: AppColors.transparent,
                            builder: (context) => AdvancedSettingsModal(),
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 15,
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: CupertinoColors.opaqueSeparator,
                ),
              ),
            ],
          ),),
    );
    //return Placeholder();
  }
}

class GameSettingsCard extends StatefulWidget {
  final Function(int) onStartingPointsChanged;
  final Function(Mode) onModeChanged;
  final Function(int) onSizeChanged;
  final Function(Type) onTypeChanged;

  GameSettingsCard({this.onStartingPointsChanged, this.onModeChanged, this.onSizeChanged, this.onTypeChanged})
      : assert(onStartingPointsChanged != null),
        assert(onModeChanged != null),
        assert(onSizeChanged != null),
        assert(onTypeChanged != null);

  @override
  _GameSettingsCardState createState() => _GameSettingsCardState();
}

class _GameSettingsCardState extends State<GameSettingsCard> {
  String valueStartingPoints = '0';
  String valueMode = '0';
  int valueSize = 1;
  String valueType = '0';


  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
        AppLocalizations.of(context).modus,
        maxLines: 1,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      flexBody: 237,
      body: Row(
        children: [
          Spacer(
            flex: 25,
          ),
          Expanded(
            flex: 328,
            child: Column(
              children: [
                Spacer(
                  flex: 13,
                ),
                AutoSizeText(
                  AppLocalizations.of(context).startingPoints,
                  maxLines: 1,
                ),
                Spacer(
                  flex: 11,
                ),
                Expanded(
                  flex: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl(
                          groupValue: valueStartingPoints,
                          children: {'0': Text('301'), '1': Text('501'), '2': Text('701')},
                          onValueChanged: (newValue) {
                            setState(() {
                              valueStartingPoints = newValue;
                            });
                            widget.onStartingPointsChanged(newValue == '0'
                                ? 301
                                : newValue == '1'
                                    ? 501
                                    : 701);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 20,
                ),
                AutoSizeText(
                  AppLocalizations.of(context).gameMode,
                  maxLines: 1,
                ),
                Spacer(
                  flex: 11,
                ),
                Expanded(
                    flex: 60,
                    child: Row(
                      children: [
                        Expanded(
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: valueMode,
                            children: {
                              '0': Text(
                                'FIRST TO',
                              ),
                              '1': Text(
                                'BEST OF',
                              )
                            },
                            onValueChanged: (newValue) {
                              setState(() {
                                valueMode = newValue;
                              });
                              widget.onModeChanged(newValue == '0' ? Mode.firstTo : Mode.bestOf);
                            },
                          ),
                        ),
                      ],
                    )),
                Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 37,
                  child: CupertinoPicker(
                    children: [for (var i = 1; i <= 100; i += 1) Text(i.toString())],
                    itemExtent: 25,
                    onSelectedItemChanged: (item) {
                      setState(() {
                        valueSize = item + 1;
                      });
                      widget.onSizeChanged(valueSize);
                    },
                  ),
                ),
                Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl(
                          groupValue: valueType,
                          children: {'0': Text(valueSize == 1 ? 'LEG' : 'LEGS'), '1': Text(valueSize == 1 ? 'SET' : 'SETS')},
                          onValueChanged: (newValue) {
                            setState(() {
                              valueType = newValue;
                            });
                            widget.onTypeChanged(newValue == '0' ? Type.legs : Type.sets);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 17,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 25,
          ),
        ],
      ),
    );
  }
}

class AdvancedSettingsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: Text(
                  AppLocalizations.of(context).showAverage,
                style: TextStyle(color: AppColors.white),
              ),
              trailing: CupertinoSwitch(
                value: true,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: Text(
                AppLocalizations.of(context).showCheckoutPercentage,
                style: TextStyle(color: AppColors.white),
              ),
              trailing: CupertinoSwitch(
                value: false,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: Row(
                children: [
                  Spacer(
                    flex: 104,
                  ),
                  Expanded(
                    flex: 167,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: Container(
                        color: AppColors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.delete,
                                color: AppColors.white,
                              ),
                              Spacer(
                                flex: 10,
                              ),
                              Expanded(
                                flex: 70,
                                child: AutoSizeText(
                                  AppLocalizations.of(context).removePlayer,
                                  minFontSize: 1,
                                  maxLines: 1,
                                  style: TextStyle(color: AppColors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 104,
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: Row(
                children: [
                  Spacer(
                    flex: 134,
                  ),
                  Expanded(
                      flex: 107,
                      child: CupertinoButton(
                        onPressed: () => Navigator.pop(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          child: Container(
                            color: AppColors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Center(
                                child: AutoSizeText(
                                    AppLocalizations.of(context).done,
                                  minFontSize: 1,
                                  maxLines: 1,
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Spacer(
                    flex: 134,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdvancedSettingsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}