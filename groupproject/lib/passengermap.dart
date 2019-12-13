import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';
import 'passenger.dart';
import 'package:groupproject/driver.dart';

class PassengerMap extends StatefulWidget {
  PassengerMap({Key key, this.currentPosition, this.drivers}) : super(key: key);
  final Passenger currentPosition;
  List<Driver> drivers;


  @override
  PassengerMapState createState() => PassengerMapState();

}

class PassengerMapState extends State<PassengerMap>{

  var _geolocator = Geolocator();


  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    //var path = [widget.currentPosition.location, widget.currentPosition.destinationlatlng];
=======
    var path = [widget.currentPosition.location, widget.currentPosition.destinationlatlng];
>>>>>>> sunu-work
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
<<<<<<< HEAD
            minZoom: 14.0,
=======
            minZoom: 15.0,
>>>>>>> sunu-work
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
<<<<<<< HEAD
                        mylocation = 'Current Location: ' + widget.currentPosition.locationName;
                        print(mylocation);
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
                          content: Text(FlutterI18n.translate(context, 'mappage.Invite')),
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
                          content: Text(FlutterI18n.translate(context, 'mappage.Invite')),
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
=======
>>>>>>> sunu-work

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(FlutterI18n.translate(context, 'mappage.Invite')),
                        ));

                      },
                    ),
                  ),
                ),
                Marker(
                  width: 45.0,
                  height: 45.0,
<<<<<<< HEAD
=======
                  point: widget.drivers[1].location,
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.directions_car),
                      color: Colors.blue,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Icon clicked');

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(FlutterI18n.translate(context, 'mappage.Invite')),
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
                          content: Text(FlutterI18n.translate(context, 'mappage.Invite')),
                        ));

                      },
                    ),
                  ),
                ),
                Marker(
                  width: 45.0,
                  height: 45.0,
>>>>>>> sunu-work
                  point: widget.currentPosition.destinationlatlng,
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.star),
                      color: Colors.blue,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Icon clicked');

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Destination: ' + widget.currentPosition.destination),
                        ));

                      },
                    ),
                  ),
                ),

<<<<<<< HEAD


=======
              ],
            ),
            PolylineLayerOptions(
              polylines: [
                Polyline(
                  points: path,
                  strokeWidth: 2.0,
                  color: Colors.blue,
                ),
>>>>>>> sunu-work
              ],
            ),




          ],
        ),
      ),

    );
  }



}
