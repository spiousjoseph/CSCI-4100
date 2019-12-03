import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';

//var currentLocation = LocationData;
Position _currentPosition;







//Future<Position> position =  Geolocator().getCurrentPosition(desiredAccuracy: prefix0.LocationAccuracy.high);


//Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
//Position _currentPosition = geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);


class PassengerMap extends StatefulWidget {


  @override
  PassengerMapState createState() => PassengerMapState();

}

class PassengerMapState extends State<PassengerMap>{





  //_getCurrentLocation();
  //GoogleMapController mapController;

  var _geolocator = Geolocator();
  var _positionMessage = '';
  var centre = LatLng(43.9457842,-78.895896);


  void _updateLocation(userLocation) {

    // geolocator plug-in:
    setState(() {
      _positionMessage = userLocation.latitude.toString() + ', ' + userLocation.longitude.toString();
      centre =  LatLng(userLocation.latitude,userLocation.longitude);
    });
    print('New location: ${userLocation.latitude}, ${userLocation.longitude}.');

  }


  @override
  void initState() {
    // this is called when the location changes
    // geolocator plug-in version:

    super.initState();
    _getLocation().then((position) {
      _currentPosition = position;
      centre =  LatLng(_currentPosition.latitude,_currentPosition.longitude);
    });

    _geolocator.getPositionStream(LocationOptions(accuracy: prefix0.LocationAccuracy.best, timeInterval: 5000))
        .listen((userLocation) {
      _updateLocation(userLocation);
    }
    );


  }




  @override
  Widget build(BuildContext context) {
    centre =  LatLng(_currentPosition.latitude,_currentPosition.longitude);


    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            minZoom: 16.0,
            center: centre,
          ),
          layers: [
            TileLayerOptions(
              ///*
              // for MapBox:
                urlTemplate: 'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
                additionalOptions: {
                  'accessToken': 'pk.eyJ1IjoibW1lcHN0ZWFkIiwiYSI6ImNrM2hzdTF5ZTAxMGIzaGw2Z2tuMzRld3UifQ.gm6wZqU27OTzCDSMD_DLwA',
                  'id': 'mapbox.streets'
                }
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 45.0,
                  height: 45.0,
                  point: centre,
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
              ],
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            initState();
          });

        },
        tooltip: 'Update',
        child: Icon(Icons.update),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await _geolocator.getCurrentPosition(
          desiredAccuracy: prefix0.LocationAccuracy.best);
      _currentPosition = currentLocation;
      centre = LatLng(_currentPosition.latitude, _currentPosition.longitude);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }





}
