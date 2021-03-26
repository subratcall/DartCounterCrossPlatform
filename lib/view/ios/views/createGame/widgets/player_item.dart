import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/view/ios/views/createGame/create_game_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PlayerItem extends StatelessWidget {
  final Player player;
  final Function(int) onDismissed;

  PlayerItem(this.player, {this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 50 / 613,
      child: player.id != -1
          ? Dismissible(
              key: ValueKey(player),
              onDismissed: (_) => onDismissed(player.id),
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
                              player.profile?.username != null
                                  ? player.profile.username
                                  : player.id == -1
                                      ? 'Dartbot'
                                      : player.name,
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
                              onPressed: () => CupertinoScaffold
                                  .showCupertinoModalBottomSheet(
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
                    flex: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: CupertinoColors.opaqueSeparator,
                    ),
                  ),
                ],
              ),
            )
          : Column(
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
                        child: player.id == -1 ? Image.asset(AppImages.bot) : Image.asset(AppImages.defeat),
                      ),
                      Spacer(
                        flex: 46,
                      ),
                      Expanded(
                        flex: 167,
                        child: Center(
                          child: Text(
                            player.profile?.username != null
                                ? player.profile.username
                                : player.id == -1
                                    ? 'Dartbot'
                                    : player.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 80,
                      ),
                      Spacer(
                        flex: 15,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: CupertinoColors.opaqueSeparator,
                  ),
                ),
              ],
            ),
    );
    //return Placeholder();
  }
}
