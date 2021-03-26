import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/viewmodel/enum/social_media_button_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SocialMediaButton extends StatelessWidget {
  final SocialMediaButtonType type;
  final VoidCallback onPressed;

  SocialMediaButton({this.type, this.onPressed}) : assert(type != null);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          type == SocialMediaButtonType.facebook
              ? AppImages.facebook
              : type == SocialMediaButtonType.google
                  ? AppImages.google
                  : AppImages.instagram,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
