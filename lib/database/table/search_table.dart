import 'package:sqflite/sqflite.dart';

class SearchTable {
  static const String searchTableName = "search";

  static void createTable(Database database, int version) async {
    await database.execute('''
          CREATE TABLE search(
            id INTEGER PRIMARY KEY,
            data TEXT
          )
        ''');  
  }
}