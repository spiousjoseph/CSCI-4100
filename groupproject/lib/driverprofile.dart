import 'package:flutter/material.dart';
import 'package:groupproject/passengersetup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DriverProfile extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(

        title: Text('Profile'),

      ),
     body:    StreamBuilder(
                stream: Firestore.instance.collection('drivers').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  return ListView.builder(
                    itemExtent: 80.0,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) =>
                      _buildListItem(context, snapshot.data.documents[index]),
                  );
                }
              ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => {
            
          },
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );

  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    // document.reference.updateData({'sid' : document['sid'] + 1});
   
   
    return GestureDetector(
      child: ListTile(
      title: Text(document['name'].toString()),
      subtitle: Text(document['license'].toString()),
    ),
    onLongPress: () {
        document.reference.delete();
    },
    );
  }

}