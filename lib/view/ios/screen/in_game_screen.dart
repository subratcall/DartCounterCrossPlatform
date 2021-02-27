import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/view/ios/screen/checkout_details_screen.dart';
import 'package:dart_counter/view/ios/screen/stats_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class InGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, state, child) {
      return Scaffold(
        body: CupertinoScaffold(
          body: Builder(
            builder: (context) => CupertinoPageScaffold(
              backgroundColor: Colors.white,
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
                            backgroundColor: Colors.transparent,
                            builder: (context) => StatsScreen())),
              ),
              child: Center(
                child: CupertinoButton(
                    child: Text('CheckoutDetails'),
                    onPressed: () =>
                        CupertinoScaffold.showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => CheckoutDetailsScreen())),
              ),
            ),
          ),
        ),
      );
    });
  }
}
