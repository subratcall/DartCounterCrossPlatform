import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_fonts.dart';
import 'package:dart_counter/assets/app_paddings.dart';
import 'package:flutter/cupertino.dart';

class ErrorLabel extends StatelessWidget {
  final String errorMessage;

  ErrorLabel(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, AppPaddings.medium, 0),
        child: AutoSizeText(
          errorMessage,
          maxLines: 1,
          maxFontSize: AppFonts.mini,
          minFontSize: 1,
          style: TextStyle(color: AppColors.red),
        ),
      ),
    );
  }
}
