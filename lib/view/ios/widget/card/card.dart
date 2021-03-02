import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';

class Card extends StatelessWidget {
  final Widget leading;
  final Widget middle;
  final Widget trailing;
  final Widget body;
  final BorderRadius borderRadius;

  Card(
      {this.leading = const Spacer(),
      this.middle = const Spacer(),
      this.trailing = const Spacer(),
      this.body,
      this.borderRadius = const BorderRadius.all(Radius.circular(8.0))})
      : assert(body != null);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Column(
        children: [
          Container(
            color: AppColors.black,
            child: Row(
              children: [
                leading,
                Spacer(),
                middle,
                Spacer(),
                trailing,
              ],
            ),
            padding: const EdgeInsets.all(8.0),
          ),
          Container(
            color: AppColors.gray,
            child: Row(
              children: [
                Expanded(child: body)
              ],
            ),
            padding: const EdgeInsets.all(8.0),
          ),
        ],
      ),
    );
  }
}
