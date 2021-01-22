class Grade {
  Grade({this.id, this.sid, this.grade});
  int id;
  String sid;
  String grade;

  Grade.fromMap(Map<String,dynamic> map){
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
