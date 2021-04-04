import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart';

abstract class StorageService {
  static StorageService _instance = StorageServiceImpl._();

  /// SINGLETON INSTANCE
  static StorageService get instance {
    if (_instance == null) {
      _instance = StorageServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE
  Future<String> savePhoto(String uid, File rawData);

  Future<void> deletePhoto(String uid);
}

class StorageServiceImpl implements StorageService {
  final FirebaseStorage _firebaseStorage;

  StorageServiceImpl._() : this._firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String> savePhoto(String uid, File rawData) async {
    var ref = _firebaseStorage.ref('profilePhotos/$uid');
    var thumbnail =
        copyResize(decodeImage(rawData.readAsBytesSync()), width: 120);
    await ref.putData(
        encodePng(thumbnail), SettableMetadata(contentType: 'image/png'));
    return ref.getDownloadURL();
  }

  @override
  Future<void> deletePhoto(String uid) async {
    var ref = _firebaseStorage.ref('profilePhotos/$uid');
    await ref.delete();
  }
}
