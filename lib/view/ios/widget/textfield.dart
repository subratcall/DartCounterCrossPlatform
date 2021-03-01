import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class TextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;

  TextField({this.controller, this.placeholder, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: obscureText,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }
}
