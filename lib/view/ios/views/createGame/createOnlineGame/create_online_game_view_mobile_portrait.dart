import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/model/offline_game.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/action_button.dart';
import 'package:dart_counter/view/ios/views/createGame/widgets/dart_bot_card.dart';
import 'package:dart_counter/view/ios/views/createGame/widgets/game_settings_card.dart';
import 'package:dart_counter/view/ios/views/createGame/widgets/player_card.dart';
import 'package:dart_counter/viewmodel/create_offline_game_viewmodel.dart';
import 'package:dart_counter/viewmodel/create_online_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CreateOnlineGameViewMobilePortrait extends StatelessWidget {
  final CreateOnlineGameViewModel model;

  CreateOnlineGameViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      final double width = boxConstraints.maxWidth;
      final double height = boxConstraints.maxHeight;
      return StreamBuilder<dynamic>(
          initialData: model.outputEvents.value,
          stream: model.outputEvents,
          builder: (context, snapshot) {
            OfflineGame game = snapshot.data; // TODO
            if(game == null) {
              return Center(child: Text('Fehler'),);
            }
            return SingleChildScrollView(
              child: SizedBox(
                width: width,
                height: height,
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
                            flex: 31,
                          ),
                          Spacer(
                            flex: 31,
                          ),
                          Expanded(
                            flex: 94, // TODO +50 pro player
                            child: PlayerCard(
                              game.players,
                              onAddPlayerPressed: model.onAddPlayerPressed,
                              onRemovePlayer: model.onRemovePlayer,
                              onNameChanged: model.onNameChanged,
                              onReordered: model.onReorderPlayer,
                            ),
                          ),
                          Spacer(
                            flex: 31,
                          ),
                          Expanded(
                            flex: 281,
                            child: GameSettingsCard(
                              onStartingPointsChanged: (startingPoints) =>
                                  model.onStartingPointsChanged(startingPoints),
                              onModeChanged: (mode) =>
                                  model.onModeChanged(mode),
                              onSizeChanged: (size) =>
                                  model.onSizeChanged(size),
                              onTypeChanged: (type) =>
                                  model.onTypeChanged(type),
                            ),
                          ),
                          Spacer(
                            flex: 41,
                          ),
                          Expanded(
                            flex: 75,
                            child: ActionButton(
                              text: AppLocalizations.of(context).startGame,
                              onPressed: () {
                                model.onStartGamePressed();
                                Navigator.pushNamed(context, AppRoutes.inGameOnline);
                              },
                            ),
                          ),
                          Spacer(
                            flex: 41,
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
            );
          });
    });
  }
}
