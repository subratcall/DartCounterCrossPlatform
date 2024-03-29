import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_paddings.dart';
import 'package:flutter/cupertino.dart';

class Card extends StatelessWidget {
  final Widget leading;
  final Widget middle;
  final Widget trailing;
  final Widget body;
  final BorderRadius borderRadius;
  final EdgeInsets paddingHeader;
  final EdgeInsets paddingBody;
  final int flexHeader;
  final int flexBody;

  Card({
    this.leading = const Spacer(),
    this.middle = const Spacer(),
    this.trailing = const Spacer(),
    this.body,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(AppPaddings.medium),
    ),
    this.paddingHeader = const EdgeInsets.all(AppPaddings.medium),
    this.paddingBody = const EdgeInsets.all(AppPaddings.medium),
    this.flexHeader = 2,
    this.flexBody = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Column(
        children: [
          Expanded(
            flex: flexHeader,
            child: Container(
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
                padding: paddingHeader),
          ),
          Expanded(
            flex: flexBody,
            child: Visibility(
              visible: body != null,
              child: Container(
                color: AppColors.gray,
                padding: paddingBody,
                child: Center(
                  child: body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
