import 'dart:io';

import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/services/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileViewModel extends ViewModel {

  /// OUT

  Stream<Profile> get outProfile;

  void onDeletePhotoPressed();

  void onTakePhotoPressed();

  void onChoosePhotoPressed();
}

class ProfileViewModelImpl implements ProfileViewModel {
  final AppModel _appModel = locator<AppModel>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  Stream<Profile> get outProfile => _databaseService.profile(_appModel.uid);


  void onDeletePhotoPressed() {
    _databaseService.removePhoto(_appModel.uid);
  }

  void onTakePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
    // TODO update database
    if (pickedImage != null) {
      _databaseService.updatePhoto(_appModel.uid, File(pickedImage.path));
    }
  }

  void onChoosePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    // TODO update database
    if (pickedImage != null) {
      _databaseService.updatePhoto(_appModel.uid, File(pickedImage.path));
    }
  }

  @override
  void dispose() {

  }
}
