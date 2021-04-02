import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'sign_up_view_mobile_portrait.dart';


class SignUpView extends StatelessWidget {
  final SignUpViewModel model = SignUpViewModelImpl();
  final PageController pageController;

  SignUpView(this.pageController);

  @override
  Widget build(BuildContext context) {
    return View(
      mobilePortrait: SignUpViewMobilePortrait(model, pageController),
    );
  }
}


