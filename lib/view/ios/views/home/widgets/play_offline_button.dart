import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayOfflineButton extends StatelessWidget {

  final VoidCallback onPressed;

  PlayOfflineButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      builder: (context, boxConstraints) {
        final double width = boxConstraints.maxWidth;
        final double height = boxConstraints.maxHeight;
        return Row(
          children: [
            Spacer(
              flex: 14,
            ),
            Image.asset(AppImages.target),
            Spacer(
              flex: 25,
            ),
            Flexible(
              child: Column(
                children: [
                  Spacer(),
                  AutoSizeText(
                    AppLocalizations.of(context).online.toUpperCase(),
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                  AutoSizeText(
                    AppLocalizations.of(context).play.toUpperCase(),
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: AppColors.yellow),
                  ),
                  Spacer(),
                ],
              ),
              flex: 193,
            ),
            Spacer(
              flex: 14,
            ),
          ],
        );
      },
      onPressed: onPressed,
    );
  }
}
