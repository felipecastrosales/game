import 'dart:developer' as developer;

import 'package:dio/dio.dart';
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
      final responseData = response.data as List<dynamic>;
      return responseData
          .map<GameModel>(
              (games) => GameModel.fromJson(games as Map<String, dynamic>))
          .toList();
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 429) {
        throw Exception('Many accesses');
      }
      developer.log('$e', name: 'Dio Error');
      developer.log('$s', name: 'Dio StackTrace');
      throw Exception('Error on DioError');
    } catch (e, s) {
      developer.log('$e', name: 'Error');
      developer.log('$s', name: 'StackTrace');
      throw Exception('Error to load GamesListRepository');
    }
  }
}
