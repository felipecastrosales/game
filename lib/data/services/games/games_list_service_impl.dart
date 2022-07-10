import 'package:game/data/models/game/game_model.dart';
import 'package:game/data/repositories/games/games.dart';

import 'games.dart';

class GamesListServiceImpl implements GamesListService {
  final GamesListRepository _gamesRepository;

  GamesListServiceImpl({
    required GamesListRepository gamesRepository,
  }) : _gamesRepository = gamesRepository;

  @override
  Future<List<GameModel>> getGamesList({
    required int limit,
    required int offset,
    required int idPlatform,
  }) {
    return _gamesRepository.getGamesList(
      idPlatform: idPlatform,
      offset: offset,
      limit: limit,
    );
  }
}
