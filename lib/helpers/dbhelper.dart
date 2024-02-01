import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  //constants
  static const dbName = 'products.db';
  static const dbVersion = 1;
  //table constants
  static const tbProduct = 'products';
  static const prodCode = 'code';
  static const prodName = 'nameDesc';
  static const prodPrice = 'price';

  static Future<Database> openDb() async {
    var path = join(await getDatabasesPath(), DbHelper.dbName);
    var db = await openDatabase(path, version: DbHelper.dbVersion,
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE IF NOT EXISTS $tbProduct ($prodCode TEXT PRIMARY KEY, $prodName TEXT NOT NULL, $prodPrice DECIMAL(10,2));');
      print('table $tbProduct created');
    });
    return db;
  }
}
