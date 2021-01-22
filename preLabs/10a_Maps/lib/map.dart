// CSCI 4100U - 10a Maps

import 'gradeform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'package:location/location.dart';






class Map extends StatelessWidget {
  final centre = LatLng(43.9457842,-78.895896);
  final path = [LatLng(43.9457842,-78.893896), LatLng(43.9437842,-78.897896), LatLng(43.9457842,-78.895896)];

  var _geolocator = Geolocator();
  //var _location = Location();
  var _positionMessage = '';



  @override
  void initState() {
    // geolocator plug-in version:
    _geolocator.checkGeolocationPermissionStatus().then((GeolocationStatus geolocationStatus) {
      print('Geolocation status: $geolocationStatus.');
    });

    _geolocator.getPositionStream(LocationOptions(accuracy: prefix0.LocationAccuracy.best, timeInterval: 5000))
        .listen((userLocation) {

      //_updateLocation(userLocation);

    }
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
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
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {


        },
        tooltip: 'Update',
        child: Icon(Icons.update),
      ),
    );
  }








}

