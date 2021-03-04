import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/view/ios/views/checkout_details_view.dart';
import 'package:dart_counter/view/ios/views/stats_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/in_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<InGameViewModel>(
        builder: (context, model, child) => View(
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
                  onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: AppColors.transparent,
                    builder: (context) => StatsView(),
                  ),
                ),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text('CheckoutDetails'),
                  onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: AppColors.transparent,
                    builder: (context) => CheckoutDetailsView(),
                  ),
                ),
              ),
            ));
  }
}
