import 'dart:io';

import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/services/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileViewModel extends ViewModel {
  /// INPUT

  /// OUTPUT
  Stream<Profile> get outputProfile;

  void onDeletePhotoPressed();

  void onTakePhotoPressed();

  void onChoosePhotoPressed();
}

class ProfileViewModelImpl extends ProfileViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  @override
  Stream<Profile> get outputProfile =>
      _databaseService.profile(_authenticationService.user.uid);

  void onDeletePhotoPressed() {
    _databaseService.removePhoto(_authenticationService.user.uid);
  }

  void onTakePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
    // TODO update database
    if (pickedImage != null) {
      _databaseService.updatePhoto(
          _authenticationService.user.uid, File(pickedImage.path));
    }
  }

  void onChoosePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    // TODO update database
    if (pickedImage != null) {
      _databaseService.updatePhoto(
          _authenticationService.user.uid, File(pickedImage.path));
    }
  }

  @override
  void dispose() {}
}
