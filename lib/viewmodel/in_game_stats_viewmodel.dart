import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class InGameStatsViewModel extends ViewModel {

}

class InGameStatsViewModelImpl implements InGameStatsViewModel {

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  void dispose() {

  }
}