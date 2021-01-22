import 'package:flutter/material.dart';
import 'gradeform.dart';

Grade g1 = new Grade('100555297', 'A+');
Grade g2 = new Grade('100123456', 'B-');
Grade g3 = new Grade('101888456', 'C+');
Grade g4 = new Grade('100666999', 'A+');
Grade g5 = new Grade('100333444', 'D-');
Grade g6 = new Grade('100444999', 'A+');
Grade g7 = new Grade('100643976', 'C');
Grade g8 = new Grade('100111000', 'A-');
Grade g9 = new Grade('100888333', 'D');
List<Grade> mygrades = [g1, g2, g3, g4, g5, g6, g7, g8, g9];
ListGrades listGrades = new ListGrades();



void main() => runApp(MyApp());

class Grade {
  String sid;
  String grade;

  Grade(String id, String g){
    sid = id;
    grade = g;
  }


}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 05 06',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lab 05 06'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
          ),
          IconButton(
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
          child: ListView.builder
            (
              itemCount: mygrades.length,
              itemBuilder: (BuildContext context, int index) {
                return new ListTile(
                  title: Text(mygrades[index].sid),
                  subtitle: Text(mygrades[index].grade),
                );
              }
          ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GradeForm()
              ));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



class ListGrades {
  List<Grade> listofgrades;

  ListGrades listGrades(){

  }
  void setListofGrades(List<Grade> listgrades){
    this.listofgrades = listgrades;
  }

  ListView ListofGrades;
  Widget buildList(BuildContext context){
    ListofGrades = new ListView.builder
      (
        itemCount: listofgrades.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(listofgrades[index].sid),
            subtitle: Text(listofgrades[index].grade),
          );
        }
    );
    return ListofGrades;
  }

  void _addGrade(Grade value){
    listofgrades.add(value);
  }
  void _editGrade(){
  }
  void _deleteGrade(){
  }

}




