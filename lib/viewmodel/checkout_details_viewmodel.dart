
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class CheckoutDetailsViewModel extends ViewModel {

}

class CheckoutDetailsViewModelImpl implements CheckoutDetailsViewModel {

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  void dispose() {

  }
}