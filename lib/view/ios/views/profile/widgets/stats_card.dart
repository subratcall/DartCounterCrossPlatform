import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/sharedWidgets/card.dart';
import 'package:flutter/cupertino.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final num value;
  final String trend;

  StatsCard({this.title, this.value, this.trend});

  @override
  Widget build(BuildContext context) {
    return Card(
      middle: AutoSizeText(
        title,
        maxLines: 1,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      body: Row(
        children: [
          Spacer(),
          Visibility(
              visible: trend != null,
              child: Row(
                children: [
                  Image.asset(
                    trend == 'up' ? AppImages.trendUp : AppImages.trendDown,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              )),
          AutoSizeText(
            value?.toString() ?? '--',
            maxLines: 1,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Spacer()
        ],
      ),
    );
  }
}
