import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';
import 'passenger.dart';

//var currentLocation = LocationData;
//Position _currentPosition;
//var _geolocator = Geolocator();
//var _positionMessage = '';
//var centre = LatLng(43.9457842,-78.895896);









//Future<Position> position =  Geolocator().getCurrentPosition(desiredAccuracy: prefix0.LocationAccuracy.high);


//Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
//Position _currentPosition = geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);


class PassengerMap extends StatefulWidget {
  PassengerMap({Key key, this.currentPosition}) : super(key: key);
  final Passenger currentPosition;



  @override
  PassengerMapState createState() => PassengerMapState();


}

class PassengerMapState extends State<PassengerMap>{

  var _geolocator = Geolocator();
  //var driverLocation = LatLng(43.808158299999995, -79.1661479);//test location

  void _getDriverLocation(userLocation){

    _geolocator.placemarkFromCoordinates(userLocation.latitude, userLocation.longitude).then((List<Placemark> places) {
      print('Reverse geocoding results:');
      for (Placemark place in places) {
        print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
        //print(place.position.latitude);
        //print(place.position.longitude);
      }
    });
  }



  void _updateLocation(userLocation) {

    // geolocator plug-in:
    setState(() {
      //_positionMessage = userLocation.latitude.toString() + ', ' + userLocation.longitude.toString();
      //centre =  LatLng(userLocation.latitude,userLocation.longitude);
    });
    print('New location: ${userLocation.latitude}, ${userLocation.longitude}.');

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
    //centre =  LatLng(_currentPosition.latitude,_currentPosition.longitude);
    var driverLocation = LatLng( (widget.currentPosition.location.latitude + 0.00222), (widget.currentPosition.location.longitude + 0.00222) );//test location

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            minZoom: 16.0,
            center: widget.currentPosition.location,
          ),
          layers: [
            TileLayerOptions(
              ///*
              // for MapBox:
                urlTemplate: 'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
                additionalOptions: {
                  'accessToken': 'pk.eyJ1IjoiZ2hvc3RzaiIsImEiOiJjazNwOWt5ZDYwMHY3M2Ntbm9jNnA2MHE3In0.WTY_0iZKuUXoTKiNjVTgTg',
                  'id': 'mapbox.streets'
                }
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 45.0,
                  height: 45.0,
                  point: widget.currentPosition.location,
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.blue,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Icon clicked');
                      },
                    ),
                  ),
                ),
                Marker(
                  width: 45.0,
                  height: 45.0,
                  point: driverLocation,
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.directions_car),
                      color: Colors.blue,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Icon clicked');
                      },
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //print('I WANNA GO HERE:');
          //print(widget.currentPosition.destination);
          //refresh page

        },
        tooltip: 'Update',
        child: Icon(Icons.update),
      ),

    );
  }



}
