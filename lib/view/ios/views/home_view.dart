import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_button.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<HomeViewModel>(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).home),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.square_arrow_right, size: 35, color: AppColors.black,),
        ),
      ),
        builder: (context, model, child) {
      return Column(
        children: [
          Expanded(
            child: PrimaryButton(
              child: Text('Profile'),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.profile),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    child: Text('Invites'),
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.invite),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: PrimaryButton(
                    child: Text('Friends'),
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.friends),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: PrimaryButton(
              child: Text('Offline'),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.createGame),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: PrimaryButton(
              child: Text('Online'),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.createGame),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    child: Text('About Us'),
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.aboutUs),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: PrimaryButton(
                    child: Text('Settings'),
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.settings),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppImages.adBanner),
            ),
          ),
        ],
      );
    });
  }
}
