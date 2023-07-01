import 'package:path/path.dart';
import 'package:shopapp/data/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  static const String tableName = 'products';
  static const String nameColumn = 'name';
  static const String imageColumn = 'image';
  static const String pricColumn = 'pric';
  static const String categoryColumn = 'category';
  static const String isTopColumn = 'isTop';
  static const String isFavouriteColumn = 'isFavourite';
  static const String isCardColumn = 'isCard';
  static const String descriptionColumn = 'description';
  static const String quantityColumn = 'quantity';

  initDataBase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'mira_store_.db');
    database = await openDatabase(path, version: 1, onCreate: _onCreat);
    return database;
  }

  _onCreat(Database db, int version) async {
    await db.execute(' CREATE TABLE "$tableName" ( '
        '"id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'
        '"$nameColumn" TEXT,'
        ' "$imageColumn" TEXT,'
        ' "$pricColumn" TEXT,'
        ' "$categoryColumn" TEXT,'
        ' "$isTopColumn" BOOLEAN,'
        ' "$isFavouriteColumn" BOOLEAN,'
        ' "$isCardColumn" BOOLEAN,'
        ' "$descriptionColumn" TEXT,'
        ' "$quantityColumn" INTEGER'
        ')');
  }

  Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> tmp = [];
    await database.query(tableName).then((value) {
      // Get.to(const TestScreen());
      for (var element in value) {
        tmp.add(ProductModel.fromJson(element));
      }

      // Get.back();
      return tmp;
    });
    return tmp;
  }

  Future<int> insertNewProduct({
    required ProductModel product,
  }) async {
    int response =
        await database.insert(tableName, product.toMap()).then((value) {
      return value;
    });
    // Get.to(() => ItemPage(product));
    return response;
  }

  Future<int> updateProduct({
    required ProductModel product,
  }) async {
    int response = await database.update(
      tableName,
      product.toMap(),
      where: 'id=?',
      whereArgs: [product.id],
    );
    return response;
  }

  Future<int> deleteProduct({
    required ProductModel product,
  }) async {
    int response = await database.delete(
      tableName,
      where: 'id=?',
      whereArgs: [product.id],
    );
    return response;
  }
}
