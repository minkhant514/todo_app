import "package:path/path.dart";
import "package:sqflite/sqflite.dart";

import "../vo/task.dart";

class DataBaseHelper {
  late Database _db;

  static final int _version = 1;
  static const String tableName = "tasks";
  static const String id = "id";
  static const String title = "title";
  static const String note = "note";
  static const String repeat = "repeat";
  static const String date = "date";
  static const String time = "time";
  static const String isComplete = "isComplete";

  DataBaseHelper() {
    _createDataBase();
  }

  // Future<Database> get dataBase => _createDataBase();

  Future<Database> _createDataBase() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "tasks.db");
    _db = await openDatabase(path, version: _version);
    await _db.execute(
        "CREATE TABLE IF NOT EXISTS $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT,$title TEXT,$note TEXT, $repeat TEXT, $date TEXT, $time TEXT, $isComplete INTEGER)");
    return _db;
  }

  Future<int> insertTask(Task task) async {
    _db = await _createDataBase();
    var value = await _db.insert(
      tableName,
      task.toJson()..remove(id),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return value;
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    _db = await _createDataBase();
    return await _db.query(tableName,
        columns: [id, title, note, date, time, repeat, isComplete]);
  }

  Future<int> updateTask(Map<String, dynamic> task, int id) async {
    _db = await _createDataBase();
    return await _db.update(tableName, task, where: "$id=?", whereArgs: [id]);
  }

  Future<int> deleteTask(int id) async {
    _db = await _createDataBase();
    return await _db.delete(tableName, where: "$id=?", whereArgs: [id]);
  }

  Future<int> deleteAllTasks() async {
    _db = await _createDataBase();
    return await _db.rawDelete("DELETE FROM $tableName");
  }
}
