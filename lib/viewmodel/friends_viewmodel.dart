import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class FriendsViewModel extends ViewModel{}

class FriendsViewModelImpl implements FriendsViewModel {

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  void dispose() {

  }
}