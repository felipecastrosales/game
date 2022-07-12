import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import 'package:game/app/core/error/exception/exception.dart';
import 'package:game/data/constants/constants_api.dart';
import 'package:game/data/models/game/game_model.dart';
import 'package:game/data/services/dio/dio_service.dart';

import 'games_list_repository.dart';

class GamesListRepositoryImpl implements GamesListRepository {
  final DioService _dioService;

  GamesListRepositoryImpl({
    required DioService dioService,
  }) : _dioService = dioService;

  @override
  Future<List<GameModel>> getGamesList({
    required int limit,
    required int offset,
    required int idPlatform,
  }) async {
    try {
      var dio = _dioService.getDio();
      const baseUrl = ConstantsAPI.game;
      // var queryData = ConstantsAPI.queryData;
      final response = await dio.post(
        baseUrl,
        data: '''
          fields id, name, platforms, summary, screenshots.url, genres.name, platforms.name;
          where platforms = $idPlatform;
          limit $limit;
          offset $offset;
        ''',
      );

      var statusCode = response.statusCode;
      developer.log('$statusCode', name: 'StatusCode');

      final responseData = response.data as List<dynamic>;
      developer.log(responseData.toString());

      if (statusCode == 200) {
        return responseData
            .map<GameModel>(
                (games) => GameModel.fromMap(games as Map<String, dynamic>))
            .toList();
      } else {
        return <GameModel>[];
      }
    } on DioError catch (e, s) {
      var errorStatusCode = e.response?.statusCode;
      if (errorStatusCode == 429) {
        throw TooManyRequestsException('Many Request happening.');
      }
      developer.log('$errorStatusCode', name: 'errorStatusCode');
      developer.log('$e', name: 'Dio Error');
      developer.log('$s', name: 'Dio StackTrace');
      throw ServerException('Exception on server');
    } catch (e, s) {
      developer.log('$e', name: 'Error');
      developer.log('$s', name: 'StackTrace');
      throw ServerException('Exception when load Games List');
    }
  }
}
