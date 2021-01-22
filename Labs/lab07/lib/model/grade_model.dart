import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'db_utils.dart';
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
  //_db.collection('grades').document(todo.id).setData({ todo});
  Future<int> insertGrade(Grade todo) async {
    final db = await init();
    return await db.insert('grades', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<int> updateGrade(Grade todo) async {
    final db = await init();
    return await db.update(
      'grades',
      todo.toMap(), // data to replace with
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> deleteGrade(int id) async {
    final db = await init();
    return await db.delete(
      'grades',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Grade>> getAllGrades() async {
    final db = await init();
    List<Map<String,dynamic>> maps = await db.query('grades');
    List<Grade> todos = [];
    for (int i = 0; i < maps.length; i++) {
      todos.add(Grade.fromMap(maps[i]));
    }
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