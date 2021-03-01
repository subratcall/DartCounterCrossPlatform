import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class TextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;
  final TextInputAction textInputAction;
  final VoidCallback onEditingComplete;

  TextField(
      {this.controller,
      this.placeholder,
      this.obscureText = false,
      this.textInputAction,
      this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }
}
