import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const addressTableName = 'addressTable';

class SQFLiteOperations extends GetxController {
  late Database db;

  Future<void> openDB(String tableName) async {
    try {
      // Get a location using getDatabasesPath
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'my_db.db');
      // open the database
      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, name TEXT, number TEXT, address TEXT, landmark TEXT, pincode TEXT)');
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String,dynamic>>> getEntries(String tableName) async {
    try {
     return await db.query(tableName);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addEntry(String tableName, Map<String, dynamic> data) async {
    try {
      int count = await db.insert(tableName, data);
      return count != 0;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateEntry(
      String tableName, int id, Map<String, dynamic> data) async {
    try {
      final count = await db.update(tableName, data, where: 'id = ?', whereArgs: [id]);
      return count == 1;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteEntry(String tableName, int id) async {
    try {
      int count = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
      return count == 1;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> closeDB() async {
    await db.close();
  }
}
