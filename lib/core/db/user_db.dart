import 'package:duka/core/db/user_db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase{
  static final UserDatabase instance = UserDatabase._init();
  static Database? _database;
  UserDbModel? user;

  UserDatabase._init();

  Future<Database> get dataBase async {
    if (_database != null) return _database!;

    _database = await _initDB('$tableName.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    const String integerType = 'INTEGER NOT NULL';
    const String textType = 'TEXT NOT NULL';
    const String boolType = 'BOOLEAN NOT NULL';

    await db.execute(
      'CREATE TABLE $tableName (${UserField.id} $integerType, ${UserField.agencyId} $integerType, ${UserField.phone} $textType, ${UserField.email} $textType, ${UserField.isAvailable} $boolType, ${UserField.isActive} $boolType, ${UserField.name} $textType)'
    );
  }

  Future<int> create(UserDbModel userDbModel) async {
    user = userDbModel;

    final db = await instance.dataBase;
    return await db.insert(tableName, userDbModel.toJson());
  }

  Future read() async {
    final db = await instance.dataBase;
    final maps = await db.query(tableName);

    if (maps.isNotEmpty){
      final listModel = maps.map((json) => UserDbModel.fromJson(json)).toList();
      user = listModel.first;
      return;
    } throw Exception('No user found');
  }

  Future<int> update(UserDbModel userDbModel) async {
    final db = await instance.dataBase;
    return await db.update(
      tableName,
      userDbModel.toJson(),
      where: '${UserField.id} = ?',
      whereArgs: [userDbModel.id],
    );
  }

  Future<int> delete() async {
    final db = await instance.dataBase;
    return await db.delete(tableName);
  }

  Future dispose() async {
    final db = await instance.dataBase;
    db.close();
  }
}