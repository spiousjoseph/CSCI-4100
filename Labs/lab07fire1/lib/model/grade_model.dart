import 'dart:async';
import 'package:flutter/services.dart';
import 'package:lab07fire1/firebase_page.dart';
import 'package:sqflite/sqflite.dart';
import 'grade.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';

Future<Database> init() async {
  return openDatabase(
    path.join(await getDatabasesPath(), 'grades.db'),
    onCreate: (db, version) {
      db.execute('CREATE TABLE grades(id INTEGER PRIMARY KEY, sid TEXT, grade TEXT)');
    },
    version: 1,
  );
}

class GradeModel {
  final Firestore _db = Firestore.instance;
  CollectionReference grades = Firestore.instance.collection('grades');

  Future<void> insertGrade(Grade todo) async {
    await _db.collection('grades')
        .document(todo.id)
        .setData({
      'sid':todo.sid,
      'grade':todo.grade
    });
    var newDocument = await _db.collection("grades").add(todo.toMap());
    todo.reference = newDocument;
    print('doc id: ');
    print(todo.reference.documentID);

  }

  Firestore getDB(){
    return _db;
  }



  Future<void> updateGrade(Grade todo, String i) async {
    try {
      _db.collection('grades')
          .document(i)
          .updateData(
          {'sid':todo.sid,
            'grade':todo.grade
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteGrade(String id) async {
    print('doc id: ');
    print(id);
    var docid = id;
    try {
      return _db.collection('grades')
          .document(docid)
          .delete();
    } catch (e) {
      print(e.toString());
    }

  }


  Future<List<Grade>> getAllGrades() async {
    List<Grade> todos = [];
    _db.collection("grades")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => todos.add(Grade.fromMap(f.data)));
    });
    return todos;
  }


  Future<Grade> getGradeWithId(int id) async {
    final db = await init();
    List<Map<String,dynamic>> maps = await db.query(
      'grades',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return Grade.fromMap(maps[0]);
    } else {
      return null;
    }
  }





}

