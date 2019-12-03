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
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => DriverInvites()),
          );
          Firestore.instance.collection('drivers').add({'name': "Ted", 'license': "BBC 666"});
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

  

}