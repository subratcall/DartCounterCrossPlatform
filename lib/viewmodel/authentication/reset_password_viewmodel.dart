import 'package:dart_counter/viewmodel/viewmodel.dart';

enum ResetPasswordViewState { idle, loading, successful }

class ResetPasswordViewModel extends ViewModel<ResetPasswordViewState> {
  ResetPasswordViewModel() {
    viewState = ResetPasswordViewState.idle;
  }

  void onConfirmPressed({String email}) async {
    viewState = ResetPasswordViewState.loading;

    // TODO process data
    await Future.delayed(const Duration(seconds: 1), () {});

    viewState = ResetPasswordViewState.successful;
  }
}
