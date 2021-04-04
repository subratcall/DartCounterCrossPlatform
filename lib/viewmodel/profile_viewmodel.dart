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

  void fetchProfile();

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
  void fetchProfile() async {
    inputViewState.add(ViewState.loading);
    Profile profile =
        await _databaseService.fetchProfile(_authenticationService.user.uid);
    inputViewState.add(profile == null ? ViewState.error : ViewState.success);
    _profileController.add(profile);
  }

  /// OUTPUT
  @override
  ValueStream<Profile> get outputProfile => _profileController.stream;

  @override
  void dispose() {
    _profileController.close();
  }
}
