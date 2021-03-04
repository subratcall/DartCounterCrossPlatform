import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class Theme {

  static CupertinoThemeData get theme {
    return CupertinoThemeData(
        primaryColor: AppColors.black,
        primaryContrastingColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.white,
    );
  }

  // TODO add light mode
  static CupertinoThemeData get lightTheme {
    return CupertinoThemeData();
  }

  // TODO add dark mode
  static CupertinoThemeData get darkTheme {
    return CupertinoThemeData();
  }

}