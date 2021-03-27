import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/view/ios/sharedWidgets/card.dart';
import 'package:dart_counter/view/ios/views/createGame/widgets/anonymous_player_item.dart';
import 'package:dart_counter/view/ios/views/createGame/widgets/dart_bot_item.dart';
import 'package:dart_counter/view/ios/views/createGame/widgets/player_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reorderables/reorderables.dart';

class PlayerCard extends StatefulWidget {
  final List<Player> players;
  final Function() onAddPlayerPressed;
  final Function(int) onRemovePlayer;
  final Function(int, String) onNameChanged;
  final Function(int, int) onReordered;

  PlayerCard(this.players,
      {this.onAddPlayerPressed,
      this.onRemovePlayer,
      this.onNameChanged,
      this.onReordered})
      : assert(onAddPlayerPressed != null),
        assert(onRemovePlayer != null);

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        PrimaryScrollController.of(context) ?? ScrollController();

    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
        AppLocalizations.of(context).players,
        maxLines: 1,
        style: TextStyle(
            fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
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
                    (BuildContext context, int index) {
                      Player player = widget.players[index];
                      if (player.id == -1) {
                        return DartBotItem(player);
                      } else if (player.profile != null) {
                        return PlayerItem(
                          player,
                          onDismissed: widget.onRemovePlayer,
                        );
                      } else {
                        return AnonymousPlayerItem(
                          player,
                          onDismissed: widget.onRemovePlayer,
                          onNameChanged: (name) =>
                              widget.onNameChanged(player.id, name),
                        );
                      }
                    },
                    childCount: widget.players.length,
                  ),
                  onReorder: widget.onReordered,
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
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.green),
                        ),
                        onPressed: () => widget.onAddPlayerPressed(),
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
