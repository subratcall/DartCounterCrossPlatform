import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class PostGameViewModel extends ViewModel {

}

class PostGameViewModelImpl implements PostGameViewModel {

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  void dispose() {

  }

}