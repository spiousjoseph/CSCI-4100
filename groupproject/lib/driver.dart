import 'package:flutter/material.dart';

class Driver{
  Driver({this.name, this.car, this.seats, this.license, this.reference});
  String name;
  String car;
  int seats;
  String license;
  String reference;
  //DocumentReference reference;

  Driver.fromMap(Map<String,dynamic> map, {this.reference}){
    this.name = map['name'];
    this.car = map['car'];
    this.seats = map['seats'];
    this.license = map['license'];
  }

  Map<String,dynamic> toMap(){
    return{
      'name': this.name,
      'car': this.car,
      'seats':this.seats,
      'license':this.license
    };
  }


}