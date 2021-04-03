import 'package:firebase_storage/firebase_storage.dart';

abstract class StorageService {

  static StorageService _instance = StorageServiceImpl._();

  /// SINGLETON INSTANCE
  static StorageService get instance {
    if(_instance == null) {
      _instance = StorageServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE

}

class StorageServiceImpl implements StorageService {

  final FirebaseStorage _storage;

  StorageServiceImpl._() : this._storage = FirebaseStorage.instance;

}