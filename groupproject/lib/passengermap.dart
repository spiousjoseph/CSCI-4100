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

class PassengerMap extends StatefulWidget {
  PassengerMap({Key key, this.currentPosition}) : super(key: key);
  final Passenger currentPosition;


  @override
  PassengerMapState createState() => PassengerMapState();

}

class PassengerMapState extends State<PassengerMap>{

  var _geolocator = Geolocator();

  @override
  Widget build(BuildContext context) {
    //centre =  LatLng(_currentPosition.latitude,_currentPosition.longitude);
    var driverLocation = LatLng( (widget.currentPosition.location.latitude + 0.00222), (widget.currentPosition.location.longitude + 0.00222) );//test location
    String mylocation = '';
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
                        mylocation = widget.currentPosition.locationName;
                        



                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(mylocation),
                        ));
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

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Invite Sent!'),
                        ));

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
