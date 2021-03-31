
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class SettingsViewModel extends ViewModel{

}

class SettingsViewModelImpl implements SettingsViewModel {

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  void dispose() {

  }
}
