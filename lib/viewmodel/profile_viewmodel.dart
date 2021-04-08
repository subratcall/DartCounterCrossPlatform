import 'dart:io';

import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/services/authentication/authentication_service.dart';
import 'package:dart_counter/services/database/database_service.dart';

import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

abstract class ProfileViewModel extends ViewModel {
  /// INPUT
  void onDeletePhotoPressed();

  void onTakePhotoPressed();

  void onChoosePhotoPressed();

  /// OUTPUT

  ValueStream<Profile> get outputProfile;

}

class ProfileViewModelImpl extends ProfileViewModel {
  final DatabaseService _databaseService = DatabaseService.instance;

  /// INPUT
  void onDeletePhotoPressed() {
    _databaseService.removePhoto();
  }

  void onTakePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _databaseService.updatePhoto(File(pickedImage.path));
    }
  }

  void onChoosePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _databaseService.updatePhoto(File(pickedImage.path));
    }
  }

  /// OUTPUT
  @override
  ValueStream<Profile> get outputProfile => _databaseService.profiles;

}
