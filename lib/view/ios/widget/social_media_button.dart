import 'package:dart_counter/assets/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum SocialMediaButtonType {
  facebook,
  google,
  instagram,
}

class SocialMediaButton extends StatelessWidget {
  final SocialMediaButtonType type;
  final VoidCallback onPressed;

  SocialMediaButton({this.type, this.onPressed}) : assert(type != null);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CupertinoButton(
        padding: EdgeInsets.all(0.0),
        onPressed: onPressed,
        child: Image.asset(
          type == SocialMediaButtonType.facebook
              ? AppImages.facebook
              : type == SocialMediaButtonType.google
                  ? AppImages.google
                  : AppImages.instagram,
        ),
      ),
    );
  }
}
