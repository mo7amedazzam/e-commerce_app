import 'dart:io';
import 'package:ecommerce_app/models/home_model.dart';
import 'package:sqflite/sqflite.dart';

class DpHelper {
  DpHelper._();

  static DpHelper dpHelper = DpHelper._();
  Database database;

  initDatabase() async {
    database = await connectToDatabase();
  }

  connectToDatabase() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    // String path = directory.path + '/Ecommerce_app.db';
    // Database database =
    //     await openDatabase(path, version: 1, onCreate: (db, varsion) {
    //   db.execute(
    //       '''CREATE TABLE Cart (id INTEGER PRIMARY KEY, name TEXT,price REAL ,description TEXT,image TEXT, oldPrice DOUBLE, discount INTEGER)''');
    // });
    // return database;
  }

  addProductToCart(ProductsModel model) async {
    int x = await database.insert('Cart', model.todBJson());
    print(x);
  }

  Future<List<ProductsModel>> getAllCart() async {
    List<Map<String, Object>> list = await database.query('Cart');

    return list.map((e) => ProductsModel.fromJson(e)).toList();
  }

  deleteProductFromCart(int id) async {
    database.delete('Cart', where: 'id=?', whereArgs: [id]);
  }

  updateProductQuantity(ProductsModel productsModel) async {
    // productResponse.quantity = productResponse.quantity++;


    database.update('Cart', productsModel.todBJson(),
        where: 'id=?', whereArgs: [productsModel.id]);
  }

}
