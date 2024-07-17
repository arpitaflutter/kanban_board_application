import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AddDataDatabaseHelper
{
  static final AddDataDatabaseHelper databaseHelper = AddDataDatabaseHelper._();

  AddDataDatabaseHelper._();

  Database? database;

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
          "CREATE TABLE Kanban_board_app (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT ,desc TEXT)";

      db.execute(query);
    }, version: 1);
  }

  Future<void> insertDB({required String name, required String desc}) async {
    database = await checkDB();
    database!.insert("Kanban_board_app", {
      "name": name,
      "desc": desc
    });
  }

  Future<List> readDB()
  async {
    database = await checkDB();

    String Query = "SELECT * FROM Kanban_board_app";
    List<Map> data = await database!.rawQuery(Query);

    // List<HomeModel> downloadData = data.map((e) => HomeModel.fromJson(e)).toList();
    return data;
  }

}