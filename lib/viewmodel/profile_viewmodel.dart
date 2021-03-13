import 'dart:io';

import 'package:dart_counter/services/database_service.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends ViewModel {
  final DatabaseService _databaseService = locator<DatabaseService>();

  Stream<Profile> profile() => _databaseService.profile(appModel.uid);

  void onDeletePhotoPressed() {
    _databaseService.removePhoto(appModel.uid);
  }

  void onTakePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
    // TODO update database
    if (pickedImage != null) {
      _databaseService.updatePhoto(appModel.uid, File(pickedImage.path));
    }
  }

  void onChoosePhotoPressed() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    // TODO update database
    if (pickedImage != null) {
      _databaseService.updatePhoto(appModel.uid, File(pickedImage.path));
    }
  }
}
