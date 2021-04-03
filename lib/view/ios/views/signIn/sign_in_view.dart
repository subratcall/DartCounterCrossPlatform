import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/sign_in_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'sign_in_view_mobile_portrait.dart';

class SignInView extends StatefulWidget {
  final PageController pageController;

  SignInView(this.pageController);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final SignInViewModel model = SignInViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      mobilePortrait: SignInViewMobilePortrait(model, widget.pageController),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
