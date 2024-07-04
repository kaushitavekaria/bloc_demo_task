import 'dart:async';
import 'dart:io';
import 'package:bloc_task/database/table/search_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  static const databaseName = "MyDatabase_debug.db";
  static const databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    _database ??= await createDatabase(); 
    return _database!;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);

    var database = await openDatabase(path,
        version: databaseVersion, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    SearchTable.createTable(database, version);
  }
}