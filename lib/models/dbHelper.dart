import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE user(
          name TEXT PRIMARY KEY NOT NULL,
          age DOUBLE,
          height DOUBLE,
          weight DOUBLE,
          gender TEXT,
          profession TEXT)
        """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'soulfit.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createUser(String? name, String? profession, int? age,
      double? height, double? weight, String? gender) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'profession': profession,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender
    };

    final id = await db.insert('user', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<void> updateName(String newName, String oldName) async {
    final db = await SQLHelper.db();
    await db.update('user', {'name': newName},
        where: 'name = ?', whereArgs: [oldName]);
  }

  static Future<void> updateHeight(double newHeight, String name) async {
    final db = await SQLHelper.db();
    await db.update('user', {'height': newHeight},
        where: 'name = ?', whereArgs: [name]);
  }

  static Future<void> updateWeight(double newWeight, String name) async {
    final db = await SQLHelper.db();
    await db.update('user', {'weight': newWeight},
        where: 'name = ?', whereArgs: [name]);
  }

  static Future<void> updateProfession(
      String newProfession, String name) async {
    final db = await SQLHelper.db();
    await db.update('user', {'profession': newProfession},
        where: 'name = ?', whereArgs: [name]);
  }

  static Future<void> updateGender(String name, String gender) async {
    final db = await SQLHelper.db();
    await db.update(
      'user',
      {'gender': gender},
      where: 'name = ?',
      whereArgs: [name],
    );
  }

  static Future<void> updateAge(double age, String name) async {
    final db = await SQLHelper.db();
    await db.update('user', {'age': age}, where: 'name = ?', whereArgs: [name]);
  }

  static Future<void> deleteUser(String name) async {
    final db = await SQLHelper.db();
    await db.delete('user', where: 'name = ?', whereArgs: [name]);
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await SQLHelper.db();
    return db.query('user', orderBy: "name");
  }

  static Future<void> deleteDatabaseFile() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'soulfit.db');
    await deleteDatabase(path);
  }
}
