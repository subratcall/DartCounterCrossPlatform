import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class StatsViewModel extends ViewModel {}

class StatsViewModelImpl implements StatsViewModel {

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  void dispose() {

  }
}
