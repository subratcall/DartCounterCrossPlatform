
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {

  final Widget child;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  PrimaryButton({this.child, this.onPressed, this.borderRadius = const BorderRadius.all(Radius.circular(8.0))})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.black,
      padding: EdgeInsets.all(8.0),
      onPressed: onPressed,
      borderRadius: borderRadius,
      child: Center(
        child: child,
      ),
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  PrimaryTextButton({this.text, this.onPressed, this.borderRadius = const BorderRadius.all(Radius.circular(8.0))})
      : assert(text != null && text.length > 0);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: onPressed,
      child: AutoSizeText(
        text,
        maxLines: 1,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      borderRadius: borderRadius,
    );
  }
}


