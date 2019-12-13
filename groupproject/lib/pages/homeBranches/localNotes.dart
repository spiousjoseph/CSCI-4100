import 'package:flutter/material.dart';
import 'package:groupproject/shared/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:groupproject/models/localStorage.dart';

class LocalNotesPage extends StatefulWidget {
  LocalNotesPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  LocalNotes createState() => LocalNotes();
}

class LocalNotes extends State<LocalNotesPage>{

  final _formKey = GlobalKey<FormState>();

  String _txt = "";
  String _getTxt = "";

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Peronal Notes'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/localNotes.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Enter your personal notes here'),
                // validator: (val) => val.isEmpty ? 'Enter your name' : null,
                onChanged: (val) {
                  setState(() => _txt = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Store note texts locally
                  var n = Notes(notes: _txt);
                  _insertNotes(n);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Retrieve Stored Notes',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // load the stored notes here
                  _getNotes();
                }
              ),
              // SizedBox(height: 50.0),
              // Text(
              //   "Note Created",
              //   style: TextStyle(color: Colors.white, fontSize: 15.0),
              // ),
            ],
          ),
        ),
      ),
    );

  }

    Future<void> _insertNotes(Notes notes) async {
    // Get a reference to the database.
    final Database db = await database();

    await db.insert(
      'notes',
      notes.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Inserted: " + notes.toMap().toString());
  }

  Future<void> _getNotes() async {
    // Get a reference to the database.
    final Database db = await database();

    // Query the table for all the notes.
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Notes>.
    return List.generate(maps.length, (i) {
      return Notes(
        notes: maps[i]['notes'],
      );
    });
  }

}

