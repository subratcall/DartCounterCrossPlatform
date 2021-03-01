import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  PrimaryButton({this.text, this.onPressed})
      : assert(text != null && text.length > 0);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.black,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Center(
        child: AutoSizeText(
          text,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
