import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DictionarySqliteHelper {
  static const String dbName = 'VocabularyDB.db';
  static const int dbVersion = 1;
  static const String tbWords = 'Words';
  static const String clId = '_id';
  static const String clWord = 'word';
  static const String clCategory = 'category';
  static const String clPhonetic = 'phonetic';
  static const String clExample = 'example';
  static const String clAudio = 'audio';
  static const String clIsFavourite = 'isFavourite';

  DictionarySqliteHelper._();

  static final DictionarySqliteHelper instance = DictionarySqliteHelper._();
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initializedDB();
  }

  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, dbName),
      version: dbVersion,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''CREATE TABLE $tbWords(
            $clId INTEGER PRIMARY KEY AUTOINCREMENT, 
            $clWord TEXT NOT NULL, 
            $clCategory TEXT NOT NULL, 
            $clPhonetic TEXT NOT NULL, 
            $clExample TEXT NOT NULL, 
            $clAudio TEXT NOT NULL, 
            $clIsFavourite INTEGER NOT NULL DEFAULT 0
          )''',
        );
      },
    );
  }

  Future<void> insert(Map<String, dynamic> json) async {
    final db = await DictionarySqliteHelper.instance.database;
    const rawQuery =
        'INSERT INTO $tbWords($clWord, $clCategory, $clPhonetic, $clAudio, $clExample, $clIsFavourite) VALUES(?, ?, ?, ?, ?, ?)';
    await db.rawQuery(rawQuery, [
      json[clWord],
      json[clCategory],
      json[clPhonetic],
      json[clAudio],
      json[clExample],
      json[clIsFavourite]
    ]);
  }

  Future<int> update(Map<String, dynamic> json) async {
    final db = await DictionarySqliteHelper.instance.database;
    return await db.update(
      DictionarySqliteHelper.tbWords,
      json,
      where: '$clId = ?',
      whereArgs: json[clId],
    );
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    final db = await DictionarySqliteHelper.instance.database;
    return await db.query(tbWords);
  }

  Future<List<Map<String, dynamic>>> findOneByWord(String word) async {
    final db = await DictionarySqliteHelper.instance.database;
    const rawQuery = 'SELECT * FROM $tbWords WHERE $clWord = ?';
    return await db.rawQuery(rawQuery, [word]);
  }

  Future<List<Map<String, dynamic>>> findTopWordByAmount(int amount) async {
    final db = await DictionarySqliteHelper.instance.database;
    const rawQuery = 'SELECT * FROM $tbWords ORDER BY $clId DESC LIMIT ?';
    return await db.rawQuery(rawQuery, [amount]);
  }
}
