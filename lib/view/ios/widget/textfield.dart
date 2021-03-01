import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class TextField extends StatelessWidget {
  String placeholder;
  TextEditingController controller;

  TextField({this.placeholder, this.controller});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }
}
