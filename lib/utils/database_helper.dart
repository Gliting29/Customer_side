import 'dart:io';

import 'package:flutter_ecom/models/cart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static const _databaseName = 'CartData.db';
  static const _databaseVersion = 1;

  //making it singleton class
  DataBaseHelper._();
  static final DataBaseHelper instance = DataBaseHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await  _initDatabase();
    return _database;
  }

  _initDatabase() async  {
    Directory datadirectory = await getApplicationSupportDirectory();
    String dbpath = join(datadirectory.path,_databaseName);
    return await openDatabase(dbpath,version:_databaseVersion,onCreate: _onCreateDB);


  }

  _onCreateDB(Database db, int version ) async {

    await db.execute('''
    CREATE TABLE ${CartItem.tblCart}(
      ${CartItem.colid} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${CartItem.colName} TEXT NOT NULL,
      ${CartItem.colQuan} TEXT NOT NULL,
      ${CartItem.colpri} TEXT NOT NULL,
    )
    ''');
  }

  Future<int> insertCartItem(CartItem cartItem)async{
    Database db = await database;
    return await db.insert(CartItem.tblCart, cartItem.toMap());
  }

  Future<int> updateCartItem(CartItem cartItem)async{
    Database db = await database;
    return await db.update(CartItem.tblCart, cartItem.toMap(),
    where: '${CartItem.colid}=?',whereArgs: [cartItem.id]);
  }

  Future<int> deleteCartItem(int id)async{
    Database db = await database;
    return await db.delete(CartItem.tblCart,
    where: '${CartItem.colid}=?',whereArgs: [id]);
  }


  Future<List<CartItem>> fecthCartItem()async{
    Database db = await database;
    List<Map> cartitem= await db.query(CartItem.tblCart);
    return cartitem.length == 0
    ? []
    : cartitem.map((e) => CartItem.fromMap(e)).toList(); 
  }
}
