import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class TextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;
  final TextInputAction textInputAction;
  final VoidCallback onEditingComplete;
  final bool isValid;

  TextField(
      {this.controller,
      this.placeholder,
      this.obscureText = false,
      this.textInputAction,
      this.onEditingComplete,
      this.isValid = true});

  @override
  Widget build(BuildContext context) {
    if(isValid) {
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
    } else {
      return Stack(
        fit: StackFit.expand,
        children: [
          CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            obscureText: obscureText,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(
                color: AppColors.red,
                width: 1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
              child: Icon(
                CupertinoIcons.xmark_circle,
                color: AppColors.red,
                size: 25,
              ),
            ),
          )
        ],
      );
    }
  }
}
