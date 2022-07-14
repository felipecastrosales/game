import 'package:game/data/models/game/game_model.dart';

abstract class SqliteGamesRepository {
  Future<List<GameModel>> getGamesList({
    required int limit,
    required int offset,
    required int idPlatform,
  });

  Future<bool> checkContainGame({required GameModel games});
  Future<void> updateGame({required GameModel game});
  Future<void> updateListGames({required List<GameModel> games});
}
