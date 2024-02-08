import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:statemanagement_3b/models/product.dart';

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
    var sql =
        'CREATE TABLE IF NOT EXISTS $tbProduct ($prodCode TEXT PRIMARY KEY, $prodName TEXT NOT NULL, $prodPrice DECIMAL(10,2));';

    var db = await openDatabase(
      path,
      version: DbHelper.dbVersion,
      onCreate: (db, version) {
        db.execute(sql);
        print('table $tbProduct created');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (newVersion > oldVersion) {
          db.execute('DROP TABLE IF EXISTS $tbProduct');
          db.execute(sql);
        }
      },
    );
    return db;
  }

  static Future<void> insertProduct(Product product) async {
    final db = await DbHelper.openDb();
    // await db.rawInsert(
    //     "INSERT INTO $tbProduct($prodCode, $prodName, $prodPrice) VALUES('${product.code}', '${product.nameDesc}', ${product.price});");
    await db.insert(tbProduct, product.toMap());
    print('${product.code} inserted');
  }

  static Future<List<Map<String, dynamic>>> fetchProducts() async {
    final db = await DbHelper.openDb();
    // return await db.rawQuery('SELECT * FROM $tbProduct');
    return await db.query(tbProduct);
  }
}
