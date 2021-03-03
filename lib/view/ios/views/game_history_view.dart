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

class GameHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<GameHistoryViewModel>(
      builder: (context, model, child) => CupertinoView(
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          child: FutureBuilder(
              future: model.fetchGames(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var games = snapshot.data;
                  return ListView.builder(
                    itemCount: games.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, index == games.length - 1 ? 0 : 4),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: GameHistoryCard(games[index]),
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
                  // TODO generic feedback eng, ger
                  return Center(
                    child: Text('No games found'),
                  );
                } else {
                  return LoadingView();
                }
              }),
        ),
      ),
    );
  }
}

// TODO
class GameHistoryDetailsView extends StatelessWidget {
  final Game game;

  GameHistoryDetailsView(this.game);

  @override
  Widget build(BuildContext context) {
    return CupertinoView(
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        child: Center(
          child: Text('Game details'),
        ),
      ),
    );
  }
}

// View specific widgets

// TODO display provided game
// TODO make the widget responsive
class GameHistoryCard extends StatelessWidget {
  final Game game;

  GameHistoryCard(this.game);

  @override
  Widget build(BuildContext context) {
    return Card(
      middle: AutoSizeText(
        'Best of 5 legs',
        maxLines: 1,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      trailing: AutoSizeText(
        '4 weeks ago',
        maxLines: 1,
        style: TextStyle(fontSize: 9, color: AppColors.white),
      ),
      body: Row(
        children: [
          Expanded(
            child: Image.asset(
              AppImages.win,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    AutoSizeText(
                      'Average:',
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    AutoSizeText(
                      '85.1',
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
                      'Checkout:',
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    AutoSizeText(
                      '40.19',
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
