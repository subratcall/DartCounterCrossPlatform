import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/sign_in_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'sign_in_view_mobile_portrait.dart';

class SignInView extends StatelessWidget {
  final SignInViewModel model = SignInViewModelImpl();
  final PageController pageController;

  SignInView(this.pageController);

  @override
  Widget build(BuildContext context) {
    return View(
      mobilePortrait: SignInViewMobilePortrait(model, pageController),
    );
  }
}
