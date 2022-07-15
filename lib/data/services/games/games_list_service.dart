import 'package:game/data/models/game/game_model.dart';

abstract class GamesListService {
  Future<List<GameModel>> getGamesList({
    required int limit,
    required int offset,
    required int idPlatform,
  });
}
