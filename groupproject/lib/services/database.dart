import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('users');

  Future<void> updateUserData(String name, String car, int rating) async {
    return await brewCollection.document(uid).setData({
      'name': name,
      'car': car,
      'rating': rating,
    });
  }

}