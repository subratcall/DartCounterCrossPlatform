import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/snapshots/game_snapshot.dart';
import 'package:dart_counter/model/snapshots/player_snapshot.dart';
import 'package:dart_counter/view/ios/modals/modal_fit.dart';
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
                                child: DartBotCard(),
                              ),
                              Spacer(
                                flex: 4,
                              ),
                              Expanded(
                                flex: 94 + model.currentSnapshot.players.length * 50,
                                child: PlayersCard(model.currentSnapshot.players),
                              ),
                              Spacer(
                                flex: 4,
                              ),
                              Expanded(
                                flex: 281,
                                child: GameSettingsCard(),
                              ),
                              Spacer(
                                flex: 36,
                              ),
                              Expanded(
                                flex: 75,
                                child: ActionButton(
                                  text: AppLocalizations.of(context).startGame,
                                  onPressed: () => Navigator.pushNamed(context, AppRoutes.inGame),
                                ),
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

class DartBotCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
        'Dartbot',
        maxLines: 1,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      trailing: CupertinoSwitch(
        value: true,
      ),
      flexBody: 71,
      body: Column(
        children: [
          Spacer(
            flex: 13,
          ),
          AutoSizeText(
            'Dartbot Average',
            maxLines: 1,
          ),
          Spacer(
            flex: 11,
          ),
          Expanded(
            flex: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 284,
                  child: CupertinoSlider(
                    activeColor: AppColors.green,
                    value: 1,
                  ),
                ),
                Spacer(
                  flex: 30,
                ),
                AutoSizeText(
                  '88',
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlayersCard extends StatelessWidget {
  final List<PlayerSnapshot> players;

  PlayersCard(this.players);

  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
        'Spieler',
        maxLines: 1,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      paddingBody: EdgeInsets.all(0.0),
      flexBody: 50 + players.length * 50,
      body: Column(
        children: [
          Expanded(
            flex: players.length,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: players.length,
              itemBuilder: (context, index) {
                return PlayerItem(players[index]);
              },
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: CupertinoColors.opaqueSeparator,
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: CupertinoColors.opaqueSeparator,
                ),
              ),
              Expanded(
                flex: 49,
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                        child: AutoSizeText(
                          'Spieler hinzufügen',
                          maxLines: 1,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.green),
                        ),
                        onPressed: () {},
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
  final PlayerSnapshot player;

  PlayerItem(this.player);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 50 / 613,
      child: Dismissible(
          key: ValueKey(player),
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
                          'Jonas',
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
                flex: 5,
              ),
            ],
          )),
    );
    //return Placeholder();
  }
}

class GameSettingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
        'Modus',
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
                  'Startwert',
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
                          groupValue: '0',
                          children: {'0': Text('301'), '1': Text('501'), '2': Text('701')},
                          onValueChanged: (v) => {},
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 20,
                ),
                AutoSizeText(
                  'Spielmodus',
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
                            groupValue: '0',
                            children: {
                              '0': Text(
                                'FIRST TO',
                              ),
                              '1': Text(
                                'BEST OF',
                              )
                            },
                            onValueChanged: (v) => {},
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
                    onSelectedItemChanged: (item) => {},
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
                          groupValue: '0',
                          children: {'0': Text('LEGS'), '1': Text('SETS')},
                          onValueChanged: (v) => {},
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
                'Average anzeigen',
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
                'Doppelquote anzeigen',
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
              title: ClipRRect(
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
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Spieler entfernen',
                          style: TextStyle(color: AppColors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Container(
                  color: AppColors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Text(
                          'Fertig',
                          style: TextStyle(color: AppColors.white),
                        )
                      ],
                    ),
                  ),
                ),
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
