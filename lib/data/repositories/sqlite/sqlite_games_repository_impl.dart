import 'dart:convert';

import 'package:game/data/datasource/database/sqlite/sqlite.dart';
import 'package:game/data/models/game/game_model.dart';

import 'sqlite_games_repository.dart';

class SqliteGamesRepositoryImpl implements SqliteGamesRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;
  SqliteGamesRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<List<GameModel>> getGamesList({
    required int limit,
    required int offset,
    required int idPlatform,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<bool> checkContainGame({required GameModel games}) async {
    final connection = await _sqliteConnectionFactory.openConnection();
    final result = await connection.rawQuery(
      '''
        SELECT * FROM GAMES WHERE id = ?;
      ''',
      [games.id],
    );
    return result.isNotEmpty;
  }

  @override
  Future<void> updateListGames({required List<GameModel> games}) async {
    final connection = await _sqliteConnectionFactory.openConnection();
    for (GameModel game in games) {
      if (await checkContainGame(games: game)) {
        await updateGame(game: game);
      } else {
        await connection.insert(
          'GAMES',
          {
            'id': game.id,
            'name': game.name,
            'screenshots': game.screenshots ?? '',
            'summary': game.summary ?? '',
            'genres': json
                .encode((game.genres ?? []).map((e) => e.toJson()).toList()),
            'platforms': json
                .encode((game.platforms ?? []).map((e) => e.toJson()).toList()),
          },
        );
      }
    }
  }

  @override
  Future<void> updateGame({required GameModel game}) async {
    final connection = await _sqliteConnectionFactory.openConnection();

    await connection.rawUpdate(
      '''
        UPDATE GAMES SET
          name = ?,
          screenshots = ?,
          summary = ?,
          genres = ?,
          platforms = ?
          WHERE id = ?
      ''',
      [
        game.name,
        game.screenshots ?? '',
        game.summary ?? '',
        json.encode((game.genres ?? []).map((e) => e.toJson()).toList()),
        json.encode((game.platforms ?? []).map((e) => e.toJson()).toList()),
        game.id,
      ],
    );
  }
}
