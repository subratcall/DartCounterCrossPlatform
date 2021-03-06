import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/action_button.dart';
import 'package:dart_counter/view/ios/widgets/card.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/create_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateGameViewModel>(
      builder: (context, model, child) => View(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context).createGame),
        ),
        child: Row(
          children: [
            Spacer(flex: 8,),
            Expanded(
              flex: 359,
              child: Column(
                children: [
                  Spacer(flex: 4,),
                  Expanded(
                    flex: 132,
                    child: PlayersCard(),
                  ),
                  Spacer(flex: 4,),
                  Expanded(
                    flex: 284,
                    child: GameSettingsCard(),
                  ),
                  Spacer(flex: 45,),
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
                  Spacer(flex: 141,),
                ],
              ),
            ),
            Spacer(flex: 8,),
          ],
        ),
      ),
    );
  }
}

class DartBotCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class PlayersCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class PlayerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class GameSettingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      middle: AutoSizeText(
        'Modus',
        maxLines: 1,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      body: Row(
        children: [
          Spacer(flex: 25,),
          Expanded(
            flex: 328,
            child: Column(
              children: [
                Spacer(flex: 13,),
                AutoSizeText('Startwert', maxLines: 1,),
                Spacer(flex: 11,),
                Expanded(
                  flex: 50,
                  child: CupertinoSegmentedControl(
                    children: {'0' : Text('301'), '1' : Text('501'), '2' : Text('701')},
                    onValueChanged: (v) => {},
                  ),
                ),
                Spacer(flex: 20,),
                AutoSizeText('Spielmodus', maxLines: 1,),
                Spacer(flex: 11,),
                Expanded(
                  flex: 60,
                  child: CupertinoSegmentedControl(
                    children: {'0' : Text('FIRST TO',), '1' : Text('BEST OF',)},
                    onValueChanged: (v) => {},
                  ),
                ),
                Spacer(flex: 8,),
                Expanded(
                  flex: 37,
                    child: CupertinoPicker(
                      children: [for(var i=1; i<=100; i+=1) Text(i.toString())],
                      itemExtent: 25,
                      onSelectedItemChanged: (item) => {},
                    ),
                ),
                Spacer(flex: 8,),
                Expanded(
                  flex: 50,
                  child: CupertinoSegmentedControl(
                    children: {'0' : Text('LEGS'), '1' : Text('SETS')},
                    onValueChanged: (v) => {},
                  ),
                ),
                Spacer(flex: 17,),
              ],
            ),
          ),
          Spacer(flex: 25,),
        ],
      ),
    );
  }
}

