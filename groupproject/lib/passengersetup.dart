import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'passengermap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';



class PassengerSetup extends StatefulWidget {
  @override
  PassengerSetupState createState() => PassengerSetupState();
}

class PassengerSetupState extends State<PassengerSetup>{
  TextEditingController _controllerName;
  TextEditingController _controller;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Passenger Setup'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Name: ',
                hintText: 'Enter your Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Destination: ',
                hintText: 'Enter your Destination',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {


          Navigator.push(context,
            MaterialPageRoute(builder: (context) => PassengerMap()),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }

  _getCurrentLocation() {

  }

}