import 'package:sqflite_common/sqlite_api.dart';

import 'package:game/data/constants/constants.dart';
import 'package:game/data/datasource/database/migrations/migration.dart';

class MigrationV1 implements Migration {
  static const id = DatabaseUtils.id;
  static const name = DatabaseUtils.name;
  static const screenshots = DatabaseUtils.screenshots;
  static const summary = DatabaseUtils.summary;
  static const genres = DatabaseUtils.genres;
  static const platforms = DatabaseUtils.platforms;

  @override
  void create(Batch batch) {
    batch.execute('''
      create table games(
        $id integer primary key autoincrement,
        $name text not null,
        $screenshots text not null,
        $summary text not null,
        $genres text not null,
        $platforms text not null
      );
    ''');
  }

  @override
  void update(Batch batch) {}
}
