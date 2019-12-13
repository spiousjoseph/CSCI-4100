import 'package:groupproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:groupproject/models/user.dart';

class DrivingTrip extends StatelessWidget {

  final AuthService _auth = AuthService();
  String userUID = "";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    userUID = user.uid;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('My Trip As Driver'),
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
                userUID == snapshot.data.documents[index].documentID ? _showDrivingTrip(context, snapshot.data.documents[index]) : Text(""),
            );
          }
        ),

      ),
    );
  }
  

  // Show current user's driving trip
  Widget _showDrivingTrip(BuildContext context, DocumentSnapshot document) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(document['name'] + "  -----  " + document['originDest']),
          subtitle: Text("SEATS: " + document['seats'] + "   COST: " + document['cost'] + "   Phone: " + document['phoneNum']),
        ),
    ),
    );
    
  }
}