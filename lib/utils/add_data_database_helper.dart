import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:kanban_board_app/todo/model/todo_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AddDataDatabaseHelper {
  static final AddDataDatabaseHelper databaseHelper = AddDataDatabaseHelper._();

  AddDataDatabaseHelper._();

  Database? database;

  static const columnId = 'id';
  static const todoColumn = 'todoList';
  static const progressColumn = "progressList";
  static const doneColumn = 'doneList';
  static const columnName = 'name';
  static const columnDesc = 'desc';
  static const commentColumn = 'comments';

  Future checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Future<Database>> initDB() async {
    print("Method called ================================");
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Kanban_board_app.db");

    return openDatabase(path, onCreate: (db, version) {
      String query =
          "CREATE TABLE Kanban_board_app ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT ,$columnDesc TEXT, $todoColumn TEXT, $progressColumn TEXT,$doneColumn TEXT ,$commentColumn TEXT)";

      db.execute(query);
    }, version: 1);
  }

  Future insertDB(
      {required String name,
      required String desc,
      RxList<TodoModel>? todoList,
      RxList<TodoModel>? progressList,
      RxList<TodoModel>? doneList}) async {
    database = await checkDB();
    String todoJsonString = jsonEncode(todoList);
    String progressJsonString = jsonEncode(progressList);
    String doneJsonString = jsonEncode(doneList);

    Map<String, dynamic> row = {
      todoColumn: todoJsonString,
      progressColumn: progressJsonString,
      doneColumn: doneJsonString,
      columnName: name,
      columnDesc: desc,
    };
    return database!.insert("Kanban_board_app", row);
  }

  Future<List> readDB() async {
    database = await checkDB();

    String Query = "SELECT * FROM Kanban_board_app";
    List<Map> data = await database!.rawQuery(Query);

    // List<HomeModel> downloadData = data.map((e) => HomeModel.fromJson(e)).toList();
    return data;
  }
}
