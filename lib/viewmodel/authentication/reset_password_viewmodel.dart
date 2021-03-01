import 'package:dart_counter/viewmodel/viewmodel.dart';

enum ResetPasswordViewState {
  initial, loading, successful
}


class ResetPasswordViewModel extends ViewModel<ResetPasswordViewState> {

  ResetPasswordViewModel() {
    viewState = ResetPasswordViewState.initial;
  }

  void onConfirmPressed({String email}) async {
    viewState = ResetPasswordViewState.loading;

    // TODO process data
    await Future.delayed(const Duration(seconds: 2), (){});

    viewState = ResetPasswordViewState.successful;
  }

}
