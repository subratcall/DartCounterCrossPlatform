import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/game.dart';
import 'package:flutter/cupertino.dart';

import 'card.dart';

class GameHistoryCard extends StatelessWidget {

  final Game game;

  GameHistoryCard(this.game);

  // TODO display provided game
  // TODO make the widget responsive
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
                  SizedBox(height: 10,),
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
