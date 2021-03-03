import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  PrimaryButton(
      {this.child,
      this.onPressed,
      this.borderRadius = const BorderRadius.all(
        Radius.circular(8.0),
      )})
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
