import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'passengermap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'passenger.dart';
import 'package:groupproject/driver.dart';

class PassengerSetup extends StatefulWidget {
  @override
  PassengerSetupState createState() => PassengerSetupState();
}

class PassengerSetupState extends State<PassengerSetup> {
  final TextEditingController _controllerName = new TextEditingController(text: 'John Bob');
  final TextEditingController _controllerDestination = new TextEditingController(text: '2000 Simcoe St N');
  String _city;
  String LocationName = '';
  var _geolocator = Geolocator();
  LatLng desLatLng;
  var centre;

  //left for debugging
  //String address = '17 Roscoe Rd, Toronto, ON';
  //String address = '2000 Simcoe St N, Oshawa, ON';

  void _updateLocation(userLocation) {
    // geolocator plug-in:
    setState(() {
      centre =  LatLng(userLocation.latitude,userLocation.longitude);

    });
    _geolocator.placemarkFromCoordinates(userLocation.latitude, userLocation.longitude).then((List<Placemark> places) {
      //print('Reverse geocoding results:');
      for (Placemark place in places) {
        //print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
        LocationName = '\t${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}';
      }
    });



  }
  String getLocationName(LatLng userLocation){
    String thislocationname;

    _geolocator.placemarkFromCoordinates(userLocation.latitude, userLocation.longitude).then((List<Placemark> places) {
      //print('Reverse geocoding results:');
      for (Placemark place in places) {
       // print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
        thislocationname = '\t${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}';
      }
    });

    return thislocationname;
  }


  void updateDestination(String destination)  {
    //String address = '301 Front St W, Toronto, ON';

    _geolocator.placemarkFromAddress(destination).then((List<Placemark> places) {
      print('Forward geocoding results:');
      for (Placemark place in places) {
        desLatLng = LatLng(place.position.latitude, place.position.longitude);
         print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
        print('\t${place.position.latitude}, ${place.position.longitude},');
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
                labelText: 'Select your city.',
              ),
              value: _city,
              items: <String>['Toronto, ON', 'Oshawa, ON']
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
            RaisedButton(
              onPressed: ()  {
                print('Button Pressed');
                print(_controllerDestination.text.toString() + ', ' + _city);
                updateDestination(_controllerDestination.text.toString() + ', ' + _city);
              },
              textColor: Colors.white,
              color: Color(0xFFFF9900),
              child: Text('Confirm Before Submit', style: TextStyle(fontSize: 15),),

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          //desLatLng =  await updateDestination(_controllerDestination.text.toString() + ', ' + _city);

          Passenger passenger = Passenger(
            name: _controllerName.toString(),
            destination: _controllerDestination.text.toString() + ', ' + _city,
            location: centre,
            locationName: LocationName,
            destinationlatlng: desLatLng,
          );


          //driver dummies
          Driver d1 = new Driver(
            name: 'John Snow',
            car: 'Honda Civic',
            seats: 2,
            location: LatLng( (centre.latitude + 0.00222), (centre.longitude + 0.00222) ),
            locationName: getLocationName(LatLng( (centre.latitude + 0.00222), (centre.longitude + 0.00222) )),
          );
          Driver d2 = new Driver(
            name: 'DIO',
            car: 'Lamborghini Aventador',
            seats: 1,
            location: LatLng( (centre.latitude - 0.00222), (centre.longitude + 0.00222) ),
            locationName: getLocationName(LatLng( (centre.latitude - 0.00222), (centre.longitude + 0.00222) )),
          );
          Driver d3 = new Driver(
            name: 'Bob Lee',
            car: 'Tesla Model 3',
            seats: 2,
            location: LatLng( (centre.latitude - 0.00222), (centre.longitude - 0.00222) ),
            locationName: getLocationName(LatLng( (centre.latitude - 0.00222), (centre.longitude - 0.00222) )),
          );

          List<Driver> drivers = [d1, d2, d3];




          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PassengerMap(currentPosition: passenger, drivers: drivers,)),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }


}
