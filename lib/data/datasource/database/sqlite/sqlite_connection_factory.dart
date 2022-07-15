import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import 'package:game/data/constants/constants.dart';

import 'sqlite.dart';

class SqliteConnectionFactory {
  static const version = DatabaseUtils.v1;
  static const name = DatabaseUtils.name;
  static SqliteConnectionFactory? _instance;
  SqliteConnectionFactory._();
  Database? _database;
  final _lock = Lock();

  factory SqliteConnectionFactory() {
    _instance ??= SqliteConnectionFactory._();
    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, name);
    if (_database == null) {
      await _lock.synchronized(
        () async {
          _database ??= await openDatabase(
            databasePathFinal,
            version: version,
            onConfigure: _onConfigure,
            onCreate: _onCreate,
            onUpgrade: _onUpgrade,
            onDowngrade: _onDowngrade,
          );
        },
      );
    }
    return _database!;
  }

  void closeConnection() {
    _database?.close();
    _database = null;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    final migrations = SqliteMigrationFactory().getCreateMigration();
    for (var migration in migrations) {
      migration.create(batch);
    }
    batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {
    final batch = db.batch();
    final migrations = SqliteMigrationFactory().getUpgradeMigration(oldVersion);
    for (var migration in migrations) {
      migration.update(batch);
    }
    batch.commit();
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int version) async {}
}
