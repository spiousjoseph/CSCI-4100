import 'package:groupproject/models/user.dart';
import 'package:groupproject/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String _userID = "";

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      _userID = user.uid;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      _userID = user.uid;

      // Automatically creates a data base for this user with the following default values
      await DatabaseService(uid: user.uid).updateUserData('N/A', 0.0, 0);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

    Future createDriverTrip(String name, double cost, int seats, double avgRating) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      _userID = user.uid; 
      
      // Creates a driver trip in the drivers database for this user
      await DatabaseService(uid: user.uid).updateDriverData(name, cost, seats, avgRating);
      _userID = user.uid.toString();
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // sign out
  Future signOut() async {
    try {
      _userID = "";
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  static String getterForUID() {
    return _userID;
  }

}