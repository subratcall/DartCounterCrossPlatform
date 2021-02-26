import 'package:dart_counter/res/app_animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
          child: Column(
            children: [
              Lottie.asset(AppAnimations.loading),
            ],
          ),
      ),
    );
  }
}
