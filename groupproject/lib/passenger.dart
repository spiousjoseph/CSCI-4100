import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Passenger{
  Passenger({this.name, this.reference});
  String name;
  String reference;
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