import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class TextField extends StatelessWidget {
  final TextEditingController controller;
  final bool autofocus;
  final bool autocorrect;
  final String placeholder;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final VoidCallback onEditingComplete;
  final bool isValid;

  TextField(
      {this.controller,
      this.autofocus = false,
      this.autocorrect: false,
      this.placeholder,
      this.obscureText = false,
      this.keyboardType,
      this.textInputAction,
      this.onEditingComplete,
      this.isValid = true});

  @override
  Widget build(BuildContext context) {
    if (isValid) {
      return CupertinoTextField(
        controller: controller,
        autofocus: autofocus,
        autocorrect: autocorrect,
        placeholder: placeholder,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      );
    } else {
      return Stack(
        fit: StackFit.expand,
        children: [
          CupertinoTextField(
            controller: controller,
            autofocus: autofocus,
            autocorrect: autocorrect,
            placeholder: placeholder,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
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
