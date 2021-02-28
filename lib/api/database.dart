import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore;

  DatabaseService() : this._firestore = FirebaseFirestore.instance;

  void insertDummyData() async {
    final ref = _firestore.collection('/test');
    await ref.doc('sinclair').set({'test': 'data'});
  }
}
