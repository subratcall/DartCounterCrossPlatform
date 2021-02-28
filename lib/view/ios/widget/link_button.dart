import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  LinkButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0.0),
      onPressed: onPressed,
      child: AutoSizeText(
        text,
        maxLines: 1,
        style: TextStyle(color: AppColors.blue),
      ),
    );
  }
}
