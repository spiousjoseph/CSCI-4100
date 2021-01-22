import 'package:flutter/material.dart';
import 'gradeform.dart';
import 'model/grade.dart';
import 'model/grade_model.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

/*
Grade g1 = new Grade(id: 0, sid:'100555297', grade:'A+');
Grade g2 = new Grade(id: 1, sid: '100123456', grade: 'B-');
Grade g3 = new Grade(id: 2, sid: '101888456', grade: 'C+');
Grade g4 = new Grade(id: 3, sid: '100666999', grade: 'A+');
Grade g5 = new Grade(id: 4, sid: '100333444', grade: 'D-');
Grade g6 = new Grade(id: 5, sid: '100444999', grade: 'A+');
Grade g7 = new Grade(id: 6, sid: '100643976', grade: 'C');
Grade g8 = new Grade(id: 7, sid: '100111000', grade: 'A-');
Grade g9 = new Grade(id: 8, sid: '100888333', grade: 'D');
*/
//List<Grade> mygrades = [g1, g2, g3, g4, g5, g6, g7, g8, g9];



List<Grade> mygrades = [];

//ListGrades listGrades = new ListGrades();


class SQLitePage extends StatefulWidget {
  String title;

  SQLitePage({this.title, Key key}) : super(key: key);

  _SQLitePageState createState() => _SQLitePageState();
}

class _SQLitePageState extends State<SQLitePage> {
  var _todoItem;
  var _lastInsertedId = 0;
  //List<Grade> mygrades;
  final _model = GradeModel();
  var selectedIndex = 0;




  @override
  Widget build(BuildContext context) {
    //_getAllGrades();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _getAllGrades(),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _editGrade(context, selectedIndex),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteGrade(selectedIndex),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          child: ListView.builder(
              itemCount: mygrades.length,
              itemBuilder: (context, int index) {
                return new ListTile(

                  onTap:(){
                    selectedIndex = index;
                    print(selectedIndex.toString() + ' HERE');
                    // ignore: unused_label, unnecessary_statements
                  },
                  title: Text(mygrades[index].sid),
                  subtitle: Text(mygrades[index].grade),
                );
              }
          ),

        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _addGrade(context),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );



  }

  Future<void> _addGrade(BuildContext context) async {
    final Grade result = await Navigator.push(context,
     MaterialPageRoute(builder: (context) => GradeForm()),
   );
    //refresh the state of your Widget
    setState(() async {
      Grade newgrade = Grade(
          sid: result.sid,
          grade: result.grade
      );
      _lastInsertedId = await _model.insertGrade(newgrade);
      //_lastInsertedId = _lastInsertedId + 1;
      //mygrades = await _model.getAllGrades();
      _getAllGrades();
      print('_lastid'+_lastInsertedId.toString());
      print(mygrades.length);
    });

  }

  Future<void> _editGrade(BuildContext context, var i) async {
    Grade result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => GradeForm()),
    );
    //refresh the state of your Widget
    ;
    setState(() async{

      Grade todoToUpdate = Grade(
          id: i,
          sid: result.sid,
        grade: result.grade,
      );
      _model.updateGrade(todoToUpdate);
      _getAllGrades();

    });

  }

  Future<void> _deleteGrade(var i) async {
    //refresh the state of your Widget
    setState(() async{
      _model.deleteGrade(i);
      _getAllGrades();
    });

  }

  Future<void> _getAllGrades() async{
    List<Grade> todos = await _model.getAllGrades();
    mygrades = await _model.getAllGrades();
    //mygrades = await _model.getAllGrades();
    setState(() {

    });
    print('grades list: ');
    for (Grade todo in todos) {
      print(todo.sid);
    }


  }





}