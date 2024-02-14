import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:favorite_books/features/home/model/home_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "books.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE books(
      id INTEGER PRIMARY KEY,
     title TEXT,
     subtitle TEXT,
     publisher TEXT,
     authors Text,
     publishedDate TEXT,
     pageCount INTEGER,
     thumbnail TEXT
   )
  ''');
  }

  Future<int> addToBook(BookModel model) async {
    final db = await instance.database;
    try {
      return await db.insert("books", model.toJson());
    } catch (e) {
      return 0;
    }
  }

  Future<int> deleteBook(String id) async {
    final db = await instance.database;
    try {
      return await db.delete("books", where: 'id=?', whereArgs: [id]);
    } catch (e) {
      return 0;
    }
  }

  Future<List<BookModel>> getAllBooks() async {
    final db = await instance.database;
    var books = await db.rawQuery("select * from books order by id desc");
    if (books.isNotEmpty) {
      final booksList = books.map((e) => BookModel.fromJsonToDb(e)).toList();
      return booksList;
    }
    return [];
  }
}
