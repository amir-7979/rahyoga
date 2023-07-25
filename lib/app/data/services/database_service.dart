import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/values/consts.dart';

class DataBaseService extends GetxService{
  static Database? _database;
  final dio = Dio();
  static final DataBaseService _instance = DataBaseService._internal();
  factory DataBaseService() => _instance;
  DataBaseService._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = appDirectory.path + 'video_database.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE video(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            course INTEGER,
            session INTEGER
          )
          ''',
        );
      },
    );
  }

  Future<int> insertVideo(Map<String, dynamic> movie) async {
    final db = await database;
    return await db.insert('video', movie);
  }

  Future<List<Map<String, dynamic>>> getAllVideo() async {
    final db = await database;
    return await db.query('video');
  }

  Future<int> deleteVideo(course, session) async {
    final db = await database;
    return await db.delete('video', where: 'course = ? AND session = ?', whereArgs: [course, session]);
  }

  Future<bool> videoExists(course, session) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'video',
      where: 'course = ? AND session = ?',
      whereArgs: [course, session],
      limit: 1,
    );
    return result.isNotEmpty;
  }
}