import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/screen/loading_screen.dart';
import 'package:dart_counter/view/ios/widget/card/game_history_card.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/game_history_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameHistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Screen<GameHistoryViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.chevron_back, size: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text(AppLocalizations.of(context).gameHistory),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: FutureBuilder(
              future: model.fetchGames(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  var games = snapshot.data;
                  return ListView.builder(
                    itemCount: games.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, index == games.length-1 ? 0 : 4),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                          child: GameHistoryCard(games[index]),
                        onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => GameHistoryDetailsScreen(games[index]))),
                      ),
                    ),
                  );
                } else if(snapshot.hasError) {
                  // TODO generic feedback eng, ger
                  return Center(child: Text('No games found'),);
                } else {
                  return LoadingScreen();
                }
              }
            ),
          ),
        )
      );
    });
  }
}

// TODO
class GameHistoryDetailsScreen extends StatelessWidget {

  final Game game;

  GameHistoryDetailsScreen(this.game);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.chevron_back, size: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text(AppLocalizations.of(context).gameHistory),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: Center(
              child: Text('Game details'),
            ),
          ),
        )
    );
  }
}
