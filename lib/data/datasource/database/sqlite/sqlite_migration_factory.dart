import 'package:game/data/datasource/database/migrations/migration.dart';
import 'package:game/data/datasource/database/migrations/versions/versions.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
      ];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];
    if (version == 1) {}
    return migrations;
  }
}
