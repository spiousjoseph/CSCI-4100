import 'dart:async';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';


Future<Database> database() async {
  return openDatabase(
    path.join(await getDatabasesPath(), 'notes.db'),
    onCreate: (db, version) {
      if (version > 1) {
        // downgrade path
      }
      db.execute('CREATE TABLE notes(notes TEXT)');
    },
    version: 1,
  );
}


// Notes class, for storaging user notes
class Notes {
  final String notes;

  Notes({this.notes});

  Map<String, dynamic> toMap() {
    return {
      'notes': notes,
    };
  }
  
  @override
  String toString() {
    return 'Notes{notes: $notes}';
  }
}