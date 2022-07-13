import 'package:game/data/models/game/game_model.dart';

import 'games_database.dart';

class GamesDatabaseImpl implements GamesDatabase {
  @override
  Future<List<GameModel>> getGamesList({
    required int limit,
    required int offset,
    required int idPlatform,
  }) {
    throw UnimplementedError();
  }
}
