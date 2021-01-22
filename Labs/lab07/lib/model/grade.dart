import 'package:cloud_firestore/cloud_firestore.dart';

class Grade {
  Grade({this.id, this.sid, this.grade});
  int id;
  String sid;
  String grade;
  DocumentReference reference;

  Grade.fromMap(Map<String,dynamic> map,{this.reference}){
    this.id = map['id'];
    this.sid = map['sid'];
    this.grade = map['grade'];
  }

  Map<String,dynamic> toMap(){
    return{
      'id': this.id,
      'sid': this.sid,
      'grade': this.grade,
    };
  }


}
