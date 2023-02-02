// ignore_for_file: constant_identifier_names

import 'dart:io' as io;
import 'package:flutter_provider_state_management/models/favorites_models.dart';
import 'package:flutter_provider_state_management/models/products_models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;
  static const String DATABASE_NAME = 'mydatabase.db';
  static const int DATABASE_VERSION = 1;

  // Tables name
  static const String FAVORITE_TABLE = 'favorites'; // Favorite table
  static const String CART_TABLE = 'cart'; // Cart table

  Future<Database?> get database async {
    if (_db != null) return _db;
    return _db = await initDatabase();
  }

  Future<Database?> initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DATABASE_NAME);
    Database database = await openDatabase(path,
        version: DATABASE_VERSION, onCreate: _onCreate);
    return database;
  }

  // 'uid': uid,
  //       'id': id,
  //       'title': title,
  //       'price': price,
  //       'description': description,
  //       'category': category,
  //       'image': image,
  //       'rate': rating,
  //       'count': ratingCount,
  //       'createdAt': createdAt,
  //       'updatedAt': updatedAt,

  Future<void> _onCreate(Database database, int version) async {
    await database.execute(
        'CREATE TABLE $FAVORITE_TABLE (uid INTEGER, id INTEGER PRIMARY KEY, title TEXT, price REAL, description TEXT, category TEXT, image TEXT, rate REAL, count INTEGER, createdAt TEXT, updatedAt TEXT)');
  }

  // Insert Favorite products to the database
  Future<FavoriteProductDatabaseModel> insertFavoriteProduct(
      FavoriteProductDatabaseModel product) async {
    final Database? dbClient = await database;
    await dbClient!.insert(FAVORITE_TABLE, product.toJson());
    return product;
  }

  // get all the favorites products from the database
  Future<List<FavoriteProductDatabaseModel>> getFavoriteProducts() async {
    final Database? dbClient = await database;
    final List<Map<String, dynamic>> response =
        await dbClient!.query(FAVORITE_TABLE);
    List<FavoriteProductDatabaseModel> list = response
        .map((data) => FavoriteProductDatabaseModel.fromJson(data))
        .toList();
    return list.isNotEmpty ? list : [];
  }

  // get individual favorite product from the database
  Future<FavoriteProductDatabaseModel?> getIndividualFavoriteProduct(
      int id) async {
    final Database? dbClient = await database;
    final List<Map<String, dynamic>> response =
        await dbClient!.query(FAVORITE_TABLE, where: 'id = ?', whereArgs: [id]);
    return response.isNotEmpty
        ? FavoriteProductDatabaseModel.fromJson(response.first)
        : null;
  }

  // Delete Favorite Product from the database
  Future<int> deleteFavoriteProduct(int id) async {
    final Database? dbClient = await database;
    return await dbClient!
        .delete(FAVORITE_TABLE, where: 'id = ?', whereArgs: [id]);
  }

  // delete all favorite products from the database
  Future<void> deleteAllFavoritesProducts() async {
    final Database? dbClient = await database;
    dbClient!.delete(FAVORITE_TABLE);
  }

  // Close Database
  Future<void> closeDatabase() async {
    final Database? dbClient = await database;
    return await dbClient!.close();
  }
}
