import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/card.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/game_history_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'game_history_details_view.dart';

class GameHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<GameHistoryViewModel>(
      builder: (context, model, child) => View(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context).gameHistory),
        ),
        child: Row(
          children: [
            Spacer(flex: 8,),
            Expanded(
              flex: 259,
              child: Column(
                children: [
                  Spacer(flex: 4,),
                  Expanded(
                    flex: 607,
                    child: FutureBuilder(
                        future: model.fetchGames(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Game> games = snapshot.data;
                            // TODO no hardcoded stuff
                            return ListView.builder(
                              itemCount: games.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, index == games.length - 1 ? 0 : 4),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: (MediaQuery.of(context).size.height-34)/7,
                                    child: GameHistoryCard(games[index]),
                                  ),
                                  onPressed: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => GameHistoryDetailsView(games[index]),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(AppLocalizations.of(context).noGamesFound),
                            );
                          } else {
                            return LoadingView();
                          }
                        }),
                  ),
                  Spacer(flex: 4,),
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

// View specific widgets

// TODO time ago and descrip in diff language
// TODO make the widget responsive
class GameHistoryCard extends StatelessWidget {
  final Game game;

  GameHistoryCard(this.game);

  @override
  Widget build(BuildContext context) {
    return Card(
      middle: AutoSizeText(
        game.description,
        maxLines: 1,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
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
              // TODO won
              true ? AppImages.win : AppImages.defeat,
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
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    AutoSizeText(
                      // TODO read owner average
                      'Average TODO',
                      //game.average.toString(),
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    AutoSizeText(
                      // TODO read owner Checkout%
                      'Checkout% TODO',
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
