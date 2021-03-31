import 'package:dart_counter/assets/app_animations.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View2(
      mobilePortrait: LoadingViewMobilePortrait(),
    );
  }
}

class LoadingViewMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return Center(
            child: Container(
              width: 100,
              height: 100,
              child: Lottie.asset(AppAnimations.loading),
            ),
          );
        }
    );
  }
}
