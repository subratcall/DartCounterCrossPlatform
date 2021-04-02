import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/gameHistory/details/game_history_details_view.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/viewmodel/game_history_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/game_history_card.dart';

class GameHistoryViewMobilePortrait extends StatelessWidget {

  final GameHistoryViewModel model;

  GameHistoryViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return Row(
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
                        child: StreamBuilder<List<Game>>(
                          stream: model.outputGames,
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
                                      height:
                                      (MediaQuery.of(context).size.height -
                                          34) /
                                          7,
                                      child: GameHistoryCard(games[index]),
                                    ),
                                    onPressed: () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(builder: (context) => GameHistoryDetailsView(games[index]),
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
                          },
                        )
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
    );
  }
}