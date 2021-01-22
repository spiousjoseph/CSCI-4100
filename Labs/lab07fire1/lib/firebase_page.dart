import 'package:flutter/material.dart';
import 'gradeform.dart';
import 'model/grade.dart';
import 'model/grade_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


List<Grade> mygrades = [];
final _model = GradeModel();
Firestore db = _model.getDB();
final grades = Firestore.instance.collection('grades');


//ListGrades listGrades = new ListGrades();


class FirebasePage extends StatefulWidget {
  String title;

  FirebasePage({this.title, Key key}) : super(key: key);

  _FirebasePageState createState() => _FirebasePageState();
}

class _FirebasePageState extends State<FirebasePage> {
  var _lastInsertedId = 0;
  var selectedIndex = 0;
  var doc;


  @override
  Widget build(BuildContext context) {

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
            onPressed: () => _editGrade(context, doc),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteGrade(doc),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          child: new StreamBuilder<QuerySnapshot>(
            stream: db.collection('grades').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              final int dataLength = snapshot.data.documents.length;
              return new ListView(
                children: snapshot.data.documents.map((data) {
                  final thisgrade = Grade.fromMap(data.data);
                  return ListTile(
                    title: new Text(thisgrade.sid),
                    subtitle: new Text (thisgrade.grade),
                    onTap:() {
                      doc = data.documentID;
                      print('DOC ID');
                      print(doc);
                    },
                  );
                }).toList(),
              );
            },
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
    _lastInsertedId = mygrades.length;

    //refresh the state of your Widget
    setState(() async {
      Grade newgrade = Grade(
        id: _lastInsertedId.toString(),
        sid: result.sid,
        grade: result.grade,
      );
      _model.insertGrade(newgrade);
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
    setState(() async{

      Grade todoToUpdate = Grade(
        sid: result.sid,
        grade: result.grade,
      );
      _model.updateGrade(todoToUpdate,i);
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
    mygrades = todos;
    //mygrades = await _model.getAllGrades();
    setState(() {

    });
    print('grades list: ');
    for (Grade todo in todos) {
      print(todo.sid);
    }


  }



}

