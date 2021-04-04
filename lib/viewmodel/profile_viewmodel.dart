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
  final AuthenticationService _authenticationService =
      AuthenticationService.instance;
  final DatabaseService _databaseService = DatabaseService.instance;

  BehaviorSubject<Profile> _profileController = BehaviorSubject();

  /// INPUT
  void onDeletePhotoPressed() {
    _databaseService.removePhoto(_authenticationService.currentUser.value.uid);
  }

  void onTakePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
    // TODO update database
    if (pickedImage != null) {
      _databaseService.updatePhoto(
          _authenticationService.currentUser.value.uid, File(pickedImage.path));
    }
  }

  void onChoosePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    // TODO update database
    if (pickedImage != null) {
      _databaseService.updatePhoto(
          _authenticationService.currentUser.value.uid, File(pickedImage.path));
    }
  }

  /// OUTPUT
  @override
  ValueStream<Profile> get outputProfile => _profileController.stream;

  @override
  void dispose() {
    _profileController.close();
  }
}
