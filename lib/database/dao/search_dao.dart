import 'dart:convert';

import 'package:bloc_task/database/database_provider.dart';
import 'package:bloc_task/model/search_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';

class SearchDAO {
  final DatabaseProvider dbProvider;

  SearchDAO([DatabaseProvider? dbProvider])
      : dbProvider = dbProvider ?? DatabaseProvider.dbProvider;

  Future<void> insertData({required List<Item> itemList}) async {
    final db = await dbProvider.database;
    for(final search in itemList) {
    bool isExist =  await exists(tableName: 'search', id: search.id, db: db);
    if(!isExist) {
      await db.insert('search',{'data': jsonEncode(search.toJson())},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    }
  }

  Future<List<Item>> getAllItems() async {
    final db = await dbProvider.database;
    final List<Map<String, dynamic>> searchMaps = await db.query('search');
    final List<Item> searchItems = [];
    for (final searchMap in searchMaps) {
      final Item item = Item.fromJson(jsonDecode(searchMap['data']));
      searchItems.add(item);
    }
    return searchItems;
  }

  /// RETURNS `BOOL` IS DATA EXISTS OR NOT
  Future<bool> exists({
    required String tableName,
    Transaction? txn,
    required int? id,
    required Database db
  }) async {
    ///
    if (txn == null) {
      ///
      return firstIntValue(
            await db.query(
              tableName,
              columns: ['COUNT(*)'],
              where: "${'id'} = ?",
              whereArgs: [id],
            ),
          ) ==
          1;
    } else {
      return firstIntValue(
            await txn.query(
              tableName,
              columns: ['COUNT(*)'],
              where: "${'id'} = ?",
              whereArgs: [id],
            ),
          ) ==
          1;
    }
  }

}
