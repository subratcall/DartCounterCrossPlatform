import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'sign_up_view_mobile_portrait.dart';

class SignUpView extends StatefulWidget {
  final PageController pageController;

  SignUpView(this.pageController);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpViewModel model = SignUpViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      mobilePortrait: SignUpViewMobilePortrait(model, widget.pageController),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
