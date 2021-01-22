import 'package:flutter/material.dart';
import 'gradeform.dart';
import 'model/grade.dart';
import 'model/grade_model.dart';

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
  int selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    _getAllGrades();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _editGrade(context, selectedIndex),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteGrade(context, selectedIndex),
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
                    print('');
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
    final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => GradeForm()),
    );
    //refresh the state of your Widget
    setState(() async {
       Grade newTodo = result;
      _lastInsertedId = await _model.insertGrade(newTodo);
      //mygrades = await _model.getAllGrades();
      print(result.sid);
    });

  }

  Future<void> _editGrade(BuildContext context, int i) async {
    Grade result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => GradeForm()),
    );
    //refresh the state of your Widget
    setState(() {

      Grade todoToUpdate = Grade(
          id: selectedIndex,
          sid: result.sid,
        grade: result.grade,
      );
      _model.updateGrade(todoToUpdate);
      //_getAllGrades();

    });

  }

  Future<void> _deleteGrade(BuildContext context, int i) async {
    //refresh the state of your Widget
    setState(() {
      _model.deleteGrade(selectedIndex);
      //_getAllGrades();
    });

  }

  Future<void> _getAllGrades() async{
    mygrades = await _model.getAllGrades();

    return mygrades;
  }





}