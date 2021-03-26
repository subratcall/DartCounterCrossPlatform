
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/game_history_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../game_history_details_view.dart';
import 'widgets/game_history_card.dart';

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
            Spacer(
              flex: 8,
            ),
            Expanded(
              flex: 259,
              child: Column(
                children: [
                  Spacer(
                    flex: 4,
                  ),
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
                                padding: EdgeInsets.fromLTRB(
                                    0, 0, 0, index == games.length - 1 ? 0 : 4),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        (MediaQuery.of(context).size.height -
                                                34) /
                                            7,
                                    child: GameHistoryCard(games[index]),
                                  ),
                                  onPressed: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          GameHistoryDetailsView(games[index]),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                  AppLocalizations.of(context).noGamesFound),
                            );
                          } else {
                            return LoadingView();
                          }
                        }),
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
        ),
      ),
    );
  }
}
