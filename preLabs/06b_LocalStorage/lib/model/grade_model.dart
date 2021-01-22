import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'db_utils.dart';
import 'grade.dart';
import 'package:path/path.dart' as path;

Future<Database> init() async {
  return openDatabase(
    path.join(await getDatabasesPath(), 'todo_list.db'),
    onCreate: (db, version) {
      db.execute('CREATE TABLE grade_items(id INTEGER PRIMARY KEY, sid TEXT, grade TEXT)');
    },
    version: 1,
  );
}

class GradeModel {
  Future<int> insertGrade(Grade todo) async {
    final db = await DBUtils.init();
    return await db.insert(
      'todo_items',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateGrade(Grade todo) async {
    final db = await DBUtils.init();
    return await db.update(
      'todo_items',
      todo.toMap(), // data to replace with
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> deleteGrade(int id) async {
    final db = await DBUtils.init();
    return await db.delete(
      'todo_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Grade>> getAllGrades() async {
    final db = await DBUtils.init();
    List<Map<String,dynamic>> maps = await db.query('todo_items');
    List<Grade> todos = [];
    for (int i = 0; i < maps.length; i++) {
      todos.add(Grade.fromMap(maps[i]));
    }
    return todos;
  }

  Future<Grade> getGradeWithId(int id) async {
    final db = await DBUtils.init();
    List<Map<String,dynamic>> maps = await db.query(
      'todo_items',
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