import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class AboutUsViewModel extends ViewModel {

}

class AboutUsViewModelImpl implements AboutUsViewModel {

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  void dispose() {

  }
}