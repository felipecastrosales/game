import 'package:sqflite_common/sqlite_api.dart';

import 'package:game/data/datasource/database/migrations/migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table games(
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
