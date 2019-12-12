import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('Users');
  final CollectionReference driverCollection = Firestore.instance.collection('Drivers');
  final CollectionReference passCollection = Firestore.instance.collection('Passengers');

  // Used as default values when a new user first creates an account.
  Future<void> updateUserData(String name, double avgRating, int ratingCount) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
    });
  }

  // Used as default values when a user creates a driver trip
  Future<void> updateDriverData(String name, double cost, int seats, double avgRating) async {
    return await driverCollection.document(uid).setData({
      'name': name,
      'cost': cost,
      'seats': seats,
      'avgRating': avgRating,
    });
  }

  // Used as default values when a user creates a trip as passenger? Is this needed?
  // Future<void> updatePassengerData(String name, double avgRating, int ratingCount) async {
  //   return await passCollection.document(uid).setData({
  //     'name': name,
  //     'avgRating': avgRating,
  //     'ratingCount': ratingCount,
  //   });
  // }
}