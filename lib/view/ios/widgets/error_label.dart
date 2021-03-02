import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class ErrorLabel extends StatelessWidget {
  final String text;

  ErrorLabel({this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: 6,
      maxLines: 1,
      style: TextStyle(color: AppColors.red),
    );
  }
}
