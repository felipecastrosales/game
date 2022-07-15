import 'package:game/data/models/game/game_model.dart';
import 'package:game/data/repositories/sqlite/sqlite.dart';

import 'sqlite_games_service.dart';

class SqliteGamesServiceImpl implements SqliteGamesService {
  final SqliteGamesRepository _gamesSqliteRepository;
  SqliteGamesServiceImpl({
    required SqliteGamesRepository gamesSqliteRepository,
  }) : _gamesSqliteRepository = gamesSqliteRepository;

  @override
  Future<bool> checkContainGame({required GameModel games}) {
    return _gamesSqliteRepository.checkContainGame(games: games);
  }

  @override
  Future<List<GameModel>> getGamesList({
    required int limit,
    required int offset,
    required int idPlatform,
  }) {
    return _gamesSqliteRepository.getGamesList(
      idPlatform: idPlatform,
      offset: offset,
      limit: limit,
    );
  }

  @override
  Future<void> updateGame({required GameModel game}) {
    return _gamesSqliteRepository.updateGame(game: game);
  }

  @override
  Future<void> updateListGames({
    required List<GameModel> games,
    required int idPlatform,
  }) {
    return _gamesSqliteRepository.updateListGames(
      games: games,
      idPlatform: idPlatform,
    );
  }
}
