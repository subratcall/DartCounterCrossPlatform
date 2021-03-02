import 'package:dart_counter/assets/app_animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
            width: 100,
            height: 100,
            child: Lottie.asset(AppAnimations.loading)),
      ),
    );
  }
}
