import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_paddings.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints) builder;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  PrimaryButton(
      {this.builder,
      this.onPressed,
      this.borderRadius = const BorderRadius.all(
        Radius.circular(AppPaddings.big),
      )});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.black,
      padding: const EdgeInsets.all(AppPaddings.medium),
      onPressed: onPressed,
      borderRadius: borderRadius,
      child: Center(
        child: LayoutBuilder(
          builder: builder,
        ),
      ),
    );
  }
}
