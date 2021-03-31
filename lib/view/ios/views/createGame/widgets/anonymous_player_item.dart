import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/view/ios/sharedWidgets/textfield.dart';
import 'package:dart_counter/view/ios/views/createGame/create_game_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AnonymousPlayerItem extends StatefulWidget {
  final Player player;
  final Function(int) onDismissed;
  final Function(String) onNameChanged;

  AnonymousPlayerItem(this.player, {this.onDismissed, this.onNameChanged});

  @override
  _AnonymousPlayerItemState createState() => _AnonymousPlayerItemState();
}

class _AnonymousPlayerItemState extends State<AnonymousPlayerItem> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    // TODO
    _nameController.text = widget.player.name;

    return Container(
      height: MediaQuery.of(context).size.height * 50 / 613,
      child: Dismissible(
        key: ValueKey<Player>(widget.player),
        onDismissed: (_) => widget.onDismissed(widget.player.id),
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
                    flex: 187,
                    child: TextField(
                      color: AppColors.white,
                      placeholder: AppLocalizations.of(context).name,
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      onChanged: (newName) => widget.onNameChanged(newName),
                      onEditingComplete: () => node.unfocus(),
                    ),
                  ),
                  Spacer(
                    flex: 35,
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
                        onPressed: () =>
                            CupertinoScaffold.showCupertinoModalBottomSheet(
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
      ),
    );
    //return Placeholder();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
