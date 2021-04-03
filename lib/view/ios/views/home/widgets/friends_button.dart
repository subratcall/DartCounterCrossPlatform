import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FriendsButton extends StatelessWidget {
  final Stream<int> newFriendRequestStream;

  final VoidCallback onPressed;

  FriendsButton({this.newFriendRequestStream, this.onPressed})
      : assert(newFriendRequestStream != null);

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
              AppIcons.users,
              size: 50,
              color: AppColors.white,
            ),
            Spacer(),
            AutoSizeText(
              AppLocalizations.of(context).friends.toUpperCase(),
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
