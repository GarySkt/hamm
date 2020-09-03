import 'package:sqflite/sqflite.dart';
import 'dart:async';


class Task {
  String name;
  Task(this.name);

  Map<String, dynamic> toMap(){
    return {
      "name": name,
    };
  }
  Task.fromMap(Map<String, dynamic> map){
    name = map['name'];
  }
}

class TaskDataBase {
  Database _db;

  initDB() async {
    _db = await openDatabase(
      'harv.db',
      version: 1,
      onCreate: (Database db, int version){
        db.execute("CREATE TABLE IF NOT EXISTS tasks (id INTEGER PRIMARY KEY, name TEXT NOT NULL);");
      }
    );

    print("INICIALIZADO");
  }

  insert(Task task) async {
    _db.insert("tasks", task.toMap());
  }

  Future<List<Task>> getAllTasks() async{
    List<Map<String, dynamic>> results = await _db.query("tasks");
    return results.map((map) => Task.fromMap(map)).toList();
  }

}