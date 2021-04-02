import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_paddings.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final bool initialIsEnabled;
  final Stream<bool> inputIsEnabled;
  final Widget Function(BuildContext, BoxConstraints) builder;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  PrimaryButton(
      {this.initialIsEnabled = true,
      this.inputIsEnabled,
      this.builder,
      this.onPressed,
      this.borderRadius = const BorderRadius.all(
        Radius.circular(AppPaddings.big),
      )});

  @override
  Widget build(BuildContext context) {
    return inputIsEnabled != null
        ? StreamBuilder<bool>(
            initialData: initialIsEnabled,
            stream: inputIsEnabled,
            builder: (context, snapshot) => CupertinoButton(
              color: AppColors.black,
              padding: const EdgeInsets.all(AppPaddings.medium),
              onPressed: snapshot.data ? onPressed : null,
              borderRadius: borderRadius,
              child: Center(
                child: LayoutBuilder(
                  builder: builder,
                ),
              ),
            ),
          )
        : CupertinoButton(
            color: AppColors.black,
            padding: const EdgeInsets.all(AppPaddings.medium),
            onPressed: onPressed,
            borderRadius: borderRadius,
            child: Center(
              child: LayoutBuilder(
                builder: builder,
              ),
            ),
          );
  }
}
