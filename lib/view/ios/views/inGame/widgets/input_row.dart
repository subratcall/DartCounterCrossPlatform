import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class InputRow extends StatelessWidget {
  final VoidCallback onUndoPressed;
  final VoidCallback onPerformThrowPressed;
  final int points;

  InputRow({this.onUndoPressed, this.onPerformThrowPressed, this.points});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 104,
          child: CupertinoButton(
            color: AppColors.red,
            onPressed: () => onUndoPressed(),
            padding: EdgeInsets.zero,
            child: Center(child: Icon(CupertinoIcons.arrow_left, size: 35)),
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 146,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              color: AppColors.black2,
              child: Center(
                child: AutoSizeText(
                  points.toString(),
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
            ),
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 104,
          child: CupertinoButton(
            color: AppColors.green,
            onPressed: () => onPerformThrowPressed(),
            padding: EdgeInsets.zero,
            child: Center(child: Icon(CupertinoIcons.arrow_right, size: 35)),
          ),
        ),
      ],
    );
  }
}
