import 'package:flutter/material.dart';
import 'package:groupproject/driverinvites.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DriverSetupPage extends StatefulWidget {
  DriverSetupPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  DriverSetup createState() => DriverSetup();
}

class DriverSetup extends State<DriverSetupPage>{
  String _name;
  String _car;
  String _NumberOfSeats;
  String _DriversLicense;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Setup'),
      actions: <Widget>[
        FlatButton(
          child: Text('EN'),
          onPressed: (){
            Locale newLocale = Locale('en');
            setState((){
              FlutterI18n.refresh(context,newLocale);
            });
          },
        ),
        FlatButton(
            child: Text('FR'),
            onPressed: () {
              Locale newLocale = Locale('fr');
              setState(() {
                FlutterI18n.refresh(context, newLocale);
              });
            }
          )
    ]
      ),
      body: StreamBuilder(
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
        
      body: Center(
        child: ListView(
          children: <Widget>[
            //Name row
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                      labelText: (FlutterI18n.translate(context, 'register.Name')),
                      hintText: (FlutterI18n.translate(context, 'register.NameHint')),
                    ),
                  ),
                TextField(
                    decoration: InputDecoration(
                      labelText: (FlutterI18n.translate(context, 'register.Car')),
                      hintText: (FlutterI18n.translate(context, 'register.CarHint')),
                    ),
                  ),
                TextFormField(
                  initialValue: '0',
                  decoration: InputDecoration(
                    labelText: (FlutterI18n.translate(context, 'register.NumberofSeats')),
                    hintText: (FlutterI18n.translate(context, 'register.SeatHint')),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: (FlutterI18n.translate(context, 'register.DriversLicense')),
                    hintText: (FlutterI18n.translate(context, 'register.LicenseHint')),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      // body: Center(
      //   child: ListView(
      //     children: <Widget>[
      //       //Name row
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           TextField(
      //               decoration: InputDecoration(
      //                 labelText: 'Name: ',
      //                 hintText: 'Enter your Name',
      //               ),
      //             ),
      //           TextField(
      //               decoration: InputDecoration(
      //                 labelText: 'Car: ',
      //                 hintText: 'Enter your Car',
      //               ),
      //             ),
      //           TextFormField(
      //             initialValue: '0',
      //             decoration: InputDecoration(
      //               labelText: 'Number of Seats: ',
      //               hintText: 'Enter your number of Seats',
      //             ),
      //           ),
      //           TextField(
      //             decoration: InputDecoration(
      //               labelText: 'Driver License: ',
      //               hintText: 'Enter your Driver License Information',
      //             ),
      //           ),
      //         ],
      //       ),

      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context,
          //   MaterialPageRoute(builder: (context) => DriverInvites()),
          // );
          Firestore.instance.collection('drivers').add({'name': "Ted", 'license': "BBC 666"});
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