import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreService {

  static FireStoreService _instance = FireStoreServiceImpl._();

  /// SINGLETON INSTANCE
  static FireStoreService get instance {
    if(_instance == null) {
      _instance = FireStoreServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE

}

class FireStoreServiceImpl implements FireStoreService {

  final FirebaseFirestore _firestore;

  FireStoreServiceImpl._() : this._firestore = FirebaseFirestore.instance;

}