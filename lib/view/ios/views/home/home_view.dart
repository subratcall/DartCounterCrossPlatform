import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/view/ios/views/home/home_view_mobile_portrait.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {

  final HomeViewModel model = HomeViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).home),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            CupertinoIcons.square_arrow_right,
            size: 34,
            color: AppColors.black,
          ),
          onPressed: () => model.onSignOutPressed(),
        ),
      ),
      mobilePortrait: HomeViewMobilePortrait(model),
    );
  }
}