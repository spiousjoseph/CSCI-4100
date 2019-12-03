import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as prefix0;

//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'passengermap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class PassengerSetup extends StatefulWidget {
  @override
  PassengerSetupState createState() => PassengerSetupState();
}

class PassengerSetupState extends State<PassengerSetup> {
  TextEditingController _controllerName;
  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Passenger Setup'),
          actions: <Widget>[
        FlatButton(
          child: Text('EN'),
          onPressed: () {
            Locale newLocale = Locale('en');
            setState(() {
              FlutterI18n.refresh(context, newLocale);
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
            })
      ]),
      body: Center(
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: (FlutterI18n.translate(context, 'pregister.Name')),
                hintText: (FlutterI18n.translate(context, 'register.NameHint')),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText:
                    (FlutterI18n.translate(context, 'pregister.Destination')),
                hintText: (FlutterI18n.translate(
                    context, 'pregister.DestinationHint')),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PassengerMap()),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }

  _getCurrentLocation() {}
}
