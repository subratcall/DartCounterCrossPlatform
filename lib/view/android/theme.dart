import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/material.dart';

class Theme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.white,
    );
  }

  // TODO add light mode
  static ThemeData get lightTheme {
    return ThemeData();
  }

  // TODO add dark mode
  static ThemeData get darkTheme {
    return ThemeData();
  }
}
