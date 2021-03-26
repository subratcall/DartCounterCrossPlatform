import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialMediaButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      child: Column(
        children: [
          Spacer(),
          Padding(
              padding: const EdgeInsets.all(7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    AppIcons.facebook,
                    size: 35,
                    color: AppColors.white,
                  ),
                  Icon(
                    AppIcons.instagram,
                    size: 35,
                    color: AppColors.white,
                  ),
                  Icon(
                    AppIcons.youtube,
                    size: 35,
                    color: AppColors.white,
                  ),
                ],
              )),
          Spacer(),
          AutoSizeText(
            AppLocalizations.of(context).socialMedia.toUpperCase(),
            maxLines: 1,
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
          Spacer(),
        ],
      ),
      onPressed: () => Navigator.pushNamed(context, AppRoutes.socialMedia),
    );
  }
}
