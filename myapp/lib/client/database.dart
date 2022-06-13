// ignore_for_file: avoid_print
import 'package:myapp/client/costumer.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:async';

class DataDB {
  static final DataDB instance = DataDB._init();

  static Database? _database;

  DataDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _openDB();
    return _database!;
  }

  Future<Database> _openDB() async {
    String text = 'TEXT NOT NULL';
    return openDatabase(
      join(await getDatabasesPath(), 'CheckData.db'),
      onCreate: (db, version) async {
        return db.execute(
          "CREATE TABLE costumers(id INTEGER PRIMARY KEY AUTOINCREMENT, firstname $text, lastname $text, email $text, password $text, phone $text, identification $text)",
        );
      },
      version: 1,
    );
  }

  // Future<List<String>> getCostumer() async {
  //   final db = await instance.database;
  //   final List<Map<String, dynamic>> query = await db.query('costumers');
  //   return List.generate(query.length, (i) {
  //     print(query[i]['firstname']);
  //     return query[i]['firstname'];
  //   });
  // }

  Future<String> checkCostumerInfo(int check, String email) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> info =
        await db.query('costumers', where: "email = ?", whereArgs: [email]);
    if (info.isEmpty) {
      print('No costumers found');
      return 'No costumers found';
    } else {
      if (check == 0) {
        return info[0]['email'];
      } else {
        return info[0]['password'];
      }
    }
  }

  Future<List<String>> getCostumerInfo(String email) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> info =
        await db.query('costumers', where: "email = ?", whereArgs: [email]);
    final List<String> returninfo = [
      info[0]['firstname'],
      info[0]['lastname'],
      info[0]['email'],
      info[0]['password'],
      info[0]['phone'],
      info[0]['identification']
    ];
    print(returninfo);
    return returninfo;
  }

  Future<void> addCostumer(Costumer client) async {
    final db = await instance.database;
    await db.insert(
      'costumers',
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Future<void> updateCostumer(Costumer client, int id) async {
  //   final db = await instance.database;
  //   await db.update(
  //     'costumers',
  //     client.toMap(),
  //     where: "id = ?",
  //     whereArgs: [client.id],
  //   );
  // }

  // Future<void> removeCostumer(int id) async {
  //   final db = await instance.database;
  //   await db.delete(
  //     'costumers',
  //     where: "id = ?",
  //     whereArgs: [id],
  //   );
  // }

  Future<void> removeAllCostumer() async {
    final db = await instance.database;
    await db.delete('costumers');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
