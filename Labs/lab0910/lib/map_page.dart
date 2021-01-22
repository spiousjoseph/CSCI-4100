import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';
import 'package:gpx/gpx.dart';
import 'package:flutter/services.dart' show rootBundle;


var gpx = Gpx();
var file = GpxReader();
var data = rootBundle.load('HalfDomeTrail.gpx');
var p = data.asStream().toList();



var path = [LatLng(43.9457842,-78.895896)];

class MapPage extends StatefulWidget {
  MapPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  List<LocationData> mylocations = [];
  var currentLocation = LocationData;



  final centre = LatLng(37.7355101,-119.565726);
  //final path = [LatLng(43.9457842,-78.893896), LatLng(43.9437842,-78.897896), LatLng(43.9457842,-78.895896)];





  var _geolocator = Geolocator();
  //var _location = Location();
  var _positionMessage = '';

  void _updateLocation(userLocation) {
    // geolocator plug-in:
    setState(() {

      _positionMessage = userLocation.latitude.toString() + ', ' + userLocation.longitude.toString();
      mylocations.add(userLocation);
    });
    print('New location: ${userLocation.latitude}, ${userLocation.longitude}.');

    for(var i = 0; i < mylocations.length; i++){

      path.add(LatLng(mylocations[i].latitude,mylocations[i].longitude));
    }



    // test out reverse geocoding
    _geolocator.placemarkFromCoordinates(userLocation.latitude, userLocation.longitude).then((List<Placemark> places) {
      print('Reverse geocoding results:');

      for (Placemark place in places) {

        print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
      }
    });

    // testing out forward geocoding
    String address = '301 Front St W, Toronto, ON';
    _geolocator.placemarkFromAddress(address).then((List<Placemark> places) {
      print('Forward geocoding results:');
      for (Placemark place in places) {
        print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
      }
    });
  }

  @override
  void initState() {
    // geolocator plug-in version:
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
      appBar: AppBar(
        title: Text('Lab 09 10'),
      ),
      body: Center(
        child: FlutterMap(
        options: MapOptions(
          minZoom: 16.0,
          center: centre,
        ),
        layers: [
           TileLayerOptions(
            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken': '<pk.eyJ1IjoiZ2hvc3RzaiIsImEiOiJjazNwOXBnbHYwMHhjM21xY2xrZHNpdnJwIn0.u_uGwnxV01UogvwukIoolA>',
              'id': 'mapbox.streets',
            },

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
          PolylineLayerOptions(
            polylines: [
              Polyline(
                points: path,
                strokeWidth: 2.0,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){



        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> getLocationUpdates(){


  }

  Future<List<ByteData>> locationdata() async {


    return p;
  }
  checkValue() async{
    final val = await p;
    print(val[0]);
    //mylocations = val;
    //centre = LatLng(_currentPosition.latitude, _currentPosition.longitude);
    //return _currentPosition = val;
  }




}
