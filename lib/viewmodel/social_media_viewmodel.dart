import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class SocialMediaViewModel extends ViewModel {}

class SocialMediaViewModelImpl implements SocialMediaViewModel {

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  void dispose() {

  }
}
