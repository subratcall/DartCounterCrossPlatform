import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/action_button.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/create_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material, ListTile;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/dart_bot_card.dart';
import 'widgets/game_settings_card.dart';
import 'widgets/player_card.dart';

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
                    height: MediaQuery.of(context).size.height + model.currentSnapshot.players.length * 50 / 613 * MediaQuery.of(context).size.height,
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
                                flex: 8,
                              ),
                              Expanded(
                                flex: model.dartBotIsActive ? 115 : 41,
                                child: DartBotCard(
                                  onActiveChanged: (isActive) =>
                                      model.onDartBotActiveChanged(isActive),
                                  onAverageChanged: (average) =>
                                      model.onDartBotAverageChanged(average),
                                ),
                              ),
                              Spacer(
                                flex: 8,
                              ),
                              Expanded(
                                flex: 94 +
                                    model.currentSnapshot.players.length * 50,
                                child: PlayerCard(
                                  model.currentSnapshot.players,
                                  onAddPlayerPressed: model.onAddPlayerPressed,
                                  onRemovePlayer: model.onRemovePlayer,
                                  onNameChanged: model.onNameChanged,
                                  onReordered: model.onReorderPlayer,
                                ),
                              ),
                              Spacer(
                                flex: 8,
                              ),
                              Expanded(
                                flex: 281,
                                child: GameSettingsCard(
                                  onStartingPointsChanged: (startingPoints) =>
                                      model.onStartingPointsChanged(
                                          startingPoints),
                                  onModeChanged: (mode) =>
                                      model.onModeChanged(mode),
                                  onSizeChanged: (size) =>
                                      model.onSizeChanged(size),
                                  onTypeChanged: (type) =>
                                      model.onTypeChanged(type),
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
                                    Navigator.pushNamed(
                                        context, AppRoutes.inGame);
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
