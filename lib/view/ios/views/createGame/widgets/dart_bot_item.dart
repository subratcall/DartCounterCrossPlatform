import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/offline_player.dart';
import 'package:flutter/cupertino.dart';

class DartBotItem extends StatelessWidget {
  final OfflinePlayer dartBot;

  DartBotItem(this.dartBot);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(dartBot),
      height: MediaQuery.of(context).size.height * 50 / 613,
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
                  child: Image.asset(AppImages.bot),
                ),
                Spacer(
                  flex: 46,
                ),
                Expanded(
                  flex: 167,
                  child: Center(
                    child: Text(
                      'Dartbot',
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
