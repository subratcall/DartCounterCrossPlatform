import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/assets/app_paddings.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialMediaButton extends StatelessWidget {
  final VoidCallback onPressed;

  SocialMediaButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        final double height = boxConstraints.maxHeight;
        return Column(
          children: [
            Spacer(),
            Padding(
                padding: const EdgeInsets.all(AppPaddings.medium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      AppIcons.facebook,
                      size: height / 4,
                      color: AppColors.white,
                    ),
                    Icon(
                      AppIcons.instagram,
                      size: height / 4,
                      color: AppColors.white,
                    ),
                    Icon(
                      AppIcons.youtube,
                      size: height / 4,
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
        );
      },
      onPressed: onPressed,
    );
  }
}
