import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class ErrorLabel extends StatelessWidget {
  final String text;

  ErrorLabel({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(fontSize: 9.0, color: AppColors.red),
    );
  }
}
