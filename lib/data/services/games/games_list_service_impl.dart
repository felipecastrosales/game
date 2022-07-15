import 'dart:developer' as developer;

import 'package:game/app/core/error/exception/exception.dart';
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
    try {
      return _gamesRepository.getGamesList(
        idPlatform: idPlatform,
        offset: offset,
        limit: limit,
      );
    } on TooManyRequestsException {
      rethrow;
    } catch (e, s) {
      developer.log('$e', name: 'Dio Error', stackTrace: s);
      developer.log('$s', name: 'Dio StackTrace', stackTrace: s);
      throw ServerException('Exception when load Games List');
    }
  }
}
