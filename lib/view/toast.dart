import 'package:dart_counter/assets/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart' as t;

class Toast {

  void showToast(String msg, {double fontSize = 16}) {
    t.Fluttertoast.showToast(
        msg: msg,
        toastLength: t.Toast.LENGTH_SHORT,
        gravity: t.ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        fontSize: fontSize);
  }
}