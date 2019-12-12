import 'package:groupproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  final FirebaseAuth _authCheck = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Hop-On!'),
          backgroundColor: Colors.orange[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),

        body: StreamBuilder(
        stream: Firestore.instance.collection('Drivers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
              _buildListItem2(context, snapshot.data.documents[index]),
          );
        }
      ),

      // Temporary Button, press to insert trip for driver, display list for pass
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _auth.createDriverTrip('Bob', 10.00, 4, 0);
        },
        tooltip: 'Add driver trip',
        child: Icon(Icons.add),
      ),

      ),
    );
  }

  
  // what passenger will see
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    // document.reference.updateData({'sid' : document['sid'] + 1});
    
      return GestureDetector(
        child: ListTile(
        title: Text(document['name'].toString() + "  -----  " + document['cost'].toStringAsFixed(2) + " CAD"),
        subtitle: Text("SEATS: " + document['seats'].toString() + "   RATING: " + document['avgRating'].toString()),
      ),
      onLongPress: () {
        document.reference.delete();
      },
      );
  }


  // what driver will see
  Widget _buildListItem2(BuildContext context, DocumentSnapshot document) {
    // document.reference.updateData({'sid' : document['sid'] + 1});
   // print(document.documentID);
   
   //FirebaseUser user = _authCheck.currentUser();
   if (checkSelf() == document.documentID) {
     print('hi');
   }
   var temp = checkSelf();
   print("LOOK HERE: " + _auth.getterForUID());

      return GestureDetector(
        child: ListTile(
        title: Text(document['name'].toString() + "  -----  " + document['cost'].toStringAsFixed(2) + " CAD"),
        subtitle: Text("SEATS: " + document['seats'].toString() + "   RATING: " + document['avgRating'].toString()),
      ),
      onLongPress: () {
        document.reference.delete();
      },
      );
  }

  Future<String> checkSelf() async {
    FirebaseUser user = await _authCheck.currentUser();
   // String temp = (user.uid).toString();
    return user.uid.toString();
  }
}