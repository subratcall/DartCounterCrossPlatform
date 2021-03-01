import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/view/ios/screen/checkout_details_screen.dart';
import 'package:dart_counter/view/ios/screen/stats_screen.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/in_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<InGameViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: CupertinoScaffold(
          body: Builder(
            builder: (context) => CupertinoPageScaffold(
              backgroundColor: AppColors.white,
              navigationBar: CupertinoNavigationBar(
                leading: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(CupertinoIcons.chevron_back, size: 35),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                middle: Text('First to 5 Legs'),
                trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(CupertinoIcons.chart_bar_fill, size: 35),
                    onPressed: () =>
                        CupertinoScaffold.showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: AppColors.transparent,
                            builder: (context) => StatsScreen())),
              ),
              child: Center(
                child: CupertinoButton(
                    child: Text('CheckoutDetails'),
                    onPressed: () =>
                        CupertinoScaffold.showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: AppColors.transparent,
                            builder: (context) => CheckoutDetailsScreen())),
              ),
            ),
          ),
        ),
      );
    });
  }
}
