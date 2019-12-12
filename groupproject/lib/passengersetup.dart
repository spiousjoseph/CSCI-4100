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
import 'passenger.dart';

class PassengerSetup extends StatefulWidget {
  @override
  PassengerSetupState createState() => PassengerSetupState();
}

class PassengerSetupState extends State<PassengerSetup> {
  final TextEditingController _controllerName = new TextEditingController();
  final TextEditingController _controllerDestination = new TextEditingController();
  String _city;
  String LocationName = '';
  var _geolocator = Geolocator();
  var centre;

  String address = '17 Roscoe Rd, Toronto, ON';
  //String address = '2000 Simcoe St N, Oshawa, ON';

  void _updateLocation(userLocation) {
    // geolocator plug-in:
    setState(() {
      centre =  LatLng(userLocation.latitude,userLocation.longitude);

    });
    _geolocator.placemarkFromCoordinates(userLocation.latitude, userLocation.longitude).then((List<Placemark> places) {
      print('Reverse geocoding results:');
      for (Placemark place in places) {
        print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
        LocationName = '\t${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}';
      }
    });

  }


  void updateDestination(destination){
    //String address = '301 Front St W, Toronto, ON';
    _geolocator.placemarkFromAddress(address).then((List<Placemark> places) {
      print('Forward geocoding results:');
      for (Placemark place in places) {
        print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
      }
    });
  }

  @override
  void initState() {
    // this is called when the location changes
    // geolocator plug-in version:

    super.initState();
    _geolocator.checkGeolocationPermissionStatus().then((GeolocationStatus geolocationStatus) {
      print('Geolocation status: $geolocationStatus.');
    });
    _geolocator.getPositionStream(LocationOptions(accuracy: prefix0.LocationAccuracy.best, timeInterval: 5000))
        .listen((userLocation) {
      _updateLocation(userLocation);
    }
    );
  }



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
              controller: _controllerName,
              decoration: InputDecoration(
                labelText: (FlutterI18n.translate(context, 'pregister.Name')),
                hintText: (FlutterI18n.translate(context, 'register.NameHint')),
              ),
            ),
            TextField(
              controller: _controllerDestination,
              decoration: InputDecoration(
                labelText:
                    (FlutterI18n.translate(context, 'pregister.Destination')),
                hintText: (FlutterI18n.translate(
                    context, 'pregister.DestinationHint')),
              ),
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'City',
              ),
              value: _city,
              items: <String>['Toronto, ON', 'Oshawa, ON ']
                  .map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  _city = newValue;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Passenger passenger = Passenger(
            name: _controllerName.toString(),
            destination: _controllerDestination.text.toString() + ', ' + _city,
            location: centre,
            locationName: LocationName,
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PassengerMap(currentPosition: passenger,)),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }


}
