import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_paddings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final Sink<String> outputText;
  final Stream<bool> inputIsValid;
  final bool autofocus;
  final bool autocorrect;
  final String placeholder;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final VoidCallback onEditingComplete;
  final Color color;

  TextField(
      {this.outputText,
      this.inputIsValid,
      this.autofocus = false,
      this.autocorrect: false,
      this.placeholder,
      this.obscureText = false,
      this.keyboardType,
      this.textInputAction,
      this.onEditingComplete,
      this.color = AppColors.gray})
      : assert(outputText != null);

  @override
  Widget build(BuildContext context) {
    return inputIsValid == null
        ? CupertinoTextField(
            autofocus: autofocus,
            autocorrect: autocorrect,
            placeholder: placeholder,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
            onChanged: outputText.add,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(AppPaddings.medium),
              ),
            ),
          )
        : StreamBuilder<bool>(
            initialData: true,
            stream: inputIsValid,
            builder: (context, snapshot) => Stack(
              fit: StackFit.expand,
              children: [
                CupertinoTextField(
                  autofocus: autofocus,
                  autocorrect: autocorrect,
                  placeholder: placeholder,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  onEditingComplete: onEditingComplete,
                  onChanged: outputText.add,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppPaddings.medium),
                    ),
                    border: snapshot.data
                        ? null
                        : Border.all(
                            color: AppColors.red,
                            width: 1,
                          ),
                  ),
                ),
                Visibility(
                  visible: !snapshot.data,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          0, 0, AppPaddings.medium, 0),
                      child: Icon(
                        CupertinoIcons.xmark_circle,
                        color: AppColors.red,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
