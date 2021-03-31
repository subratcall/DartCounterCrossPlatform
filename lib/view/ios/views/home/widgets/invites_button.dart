import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InvitesButton extends StatelessWidget {
  final Stream<int> newInvitesStream;

  final VoidCallback onPressed;

  InvitesButton({this.newInvitesStream, this.onPressed}) : assert(newInvitesStream != null);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      builder: (context, boxConstraints) {
        final double width = boxConstraints.maxWidth;
        final double height = boxConstraints.maxHeight;
        return Column(
          children: [
            Spacer(),
            Icon(
              AppIcons.mail,
              size: 50,
              color: AppColors.white,
            ),
            Spacer(),
            AutoSizeText(
              AppLocalizations.of(context).invites.toUpperCase(),
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
