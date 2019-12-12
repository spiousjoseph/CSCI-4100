//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Passenger{
  Passenger({this.name, this.reference, this.destination, this.location, this.locationName, this.destinationlatlng});
  String name;
  String reference;
  String destination;
  String locationName;
  LatLng location;
  LatLng destinationlatlng;
  //DocumentReference reference;

  Passenger.fromMap(Map<String,dynamic> map, {this.reference}){
    this.name = map['name'];
  }

  Map<String,dynamic> toMap(){
    return{
      'name': this.name,
    };
  }


}