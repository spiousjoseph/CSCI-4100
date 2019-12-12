import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'package:groupproject/driver.dart';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';
import 'passenger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class PassengerMap extends StatefulWidget {
  PassengerMap({Key key, this.currentPosition, this.drivers}) : super(key: key);
  final Passenger currentPosition;
  List<Driver> drivers;


  @override
  PassengerMapState createState() => PassengerMapState();

}

class PassengerMapState extends State<PassengerMap>{



  @override
  Widget build(BuildContext context) {





    //centre =  LatLng(_currentPosition.latitude,_currentPosition.longitude);


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
                        mylocation = 'Current Location: ' + widget.currentPosition.locationName;
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
                  point: widget.drivers[0].location,
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.directions_car),
                      color: Colors.blue,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Icon clicked');

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Driver Location: ' + widget.drivers[0].locationName),
                        ));

                      },
                    ),
                  ),
                ),

                Marker(
                  width: 45.0,
                  height: 45.0,
                  point: widget.drivers[1].location,
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.directions_car),
                      color: Colors.blue,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Icon clicked');

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Driver Location: ' + widget.drivers[0].locationName),
                        ));

                      },
                    ),
                  ),
                ),

                Marker(
                  width: 45.0,
                  height: 45.0,
                  point: widget.drivers[2].location,
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.directions_car),
                      color: Colors.blue,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Icon clicked');

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Driver Location: ' + widget.drivers[0].locationName),
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
