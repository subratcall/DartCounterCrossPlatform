import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/link_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordViewMobilePortraitSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        final double width = boxConstraints.maxWidth;
        final double height = boxConstraints.maxHeight;
        return Row(
          children: [
            Spacer(
              flex: 38,
            ),
            Expanded(
              flex: 299,
              child: Column(
                children: [
                  Spacer(
                    flex: 105,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Spacer(
                          flex: 120,
                        ),
                        Flexible(
                          child: Image.asset(AppImages.logo),
                          flex: 135,
                        ),
                        Spacer(
                          flex: 120,
                        ),
                      ],
                    ),
                    flex: 166,
                  ),
                  Spacer(
                    flex: 64,
                  ),
                  Expanded(
                    child: Icon(
                      CupertinoIcons.checkmark_alt_circle,
                      color: AppColors.green,
                      size: 60,
                    ),
                    flex: 44,
                  ),
                  Spacer(
                    flex: 22,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      AppLocalizations.of(context).emailSent,
                      maxLines: 1,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    flex: 21,
                  ),
                  Spacer(
                    flex: 28,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      AppLocalizations.of(context)
                          .checkMailAccountForPasswordResetLink,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      maxLines: 2,
                    ),
                    flex: 32,
                  ),
                  Spacer(
                    flex: 81,
                  ),
                  Flexible(
                    child: LinkButton(
                      text: AppLocalizations.of(context).login,
                      onPressed: () => Navigator.pop(context),
                    ),
                    flex: 17,
                  ),
                  Spacer(
                    flex: 158,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 38,
            ),
          ],
        );
      },
    );
  }
}
