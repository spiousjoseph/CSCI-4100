import 'package:groupproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:groupproject/models/user.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("FINALLY: " + user.uid);

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
         // print("LOOK HERE: " + _auth.getterForUID());
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
   
  //  print("Auth UID: " + AuthService.getterForUID());
  //  print("Document ID: " + document.documentID);

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
}