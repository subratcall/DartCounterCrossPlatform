import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_paddings.dart';
import 'package:flutter/cupertino.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  ActionButton(
      {this.text,
      this.onPressed,
      this.borderRadius = const BorderRadius.all(
        Radius.circular(AppPaddings.big),
      )})
      : assert(text != null && text.length > 0);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(AppPaddings.big),
      onPressed: onPressed,
      child: Center(
        child: AutoSizeText(
          text,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37),
        ),
      ),
      borderRadius: borderRadius,
      color: AppColors.green,
    );
  }
}
