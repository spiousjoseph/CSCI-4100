import 'package:flutter/material.dart';
//import 'model/grade.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'package:location/location.dart';


class MapForm extends StatelessWidget {
  final TextEditingController idCtrl = new TextEditingController();
  final TextEditingController grCtrl = new TextEditingController();
  String id = '';
  String gr = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add LAN and LON"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[

            //SID row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('LAT: '),

                Flexible(
                  child:TextField(
                    controller: idCtrl,
                    decoration: InputDecoration(
                      hintText: 'Enter LAT',
                    ),
                  ),
                ),
              ],
            ),

            //Grade row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('LON: '),

                Flexible(
                  child:TextField(
                    controller: grCtrl,
                    decoration: InputDecoration(
                        hintText: 'Enter LON'
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),


      ),

      floatingActionButton: FloatingActionButton(
        // Navigate to Add Grade Screen
        onPressed: () {
          //print(idCtrl.text + '  ' + grCtrl.text);
          var newgrade = LatLng(double.parse(idCtrl.text),double.parse(grCtrl.text));
          Navigator.of(context).pop(newgrade);


        },

        child: Icon(Icons.save),
      ),

    );
  }






}
