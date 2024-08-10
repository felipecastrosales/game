import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:game/app/core/error/exception/exception.dart';
import 'package:game/data/constants/constants.dart';
import 'package:game/data/datasource/database/sqlite/sqlite.dart';
import 'package:game/data/repositories/games/games.dart';
import 'package:game/data/repositories/sqlite/sqlite.dart';
import 'package:game/data/services/dio/dio.dart';
import 'package:game/data/services/sqlite/sqlite.dart';

class MockDio extends Mock implements Dio {}

void main() {
  const baseGameUrl = ConstantsAPI.game;
  late GamesListRepositoryImpl gamesListRepositoryImpl;
  late MockDio mockDio;

  const limit = 10;
  const offset = 10;
  const idPlatform = 1;

  setUp(() {
    mockDio = MockDio();
    gamesListRepositoryImpl = GamesListRepositoryImpl(
      dioService: DioServiceImpl(),
      sqliteGamesService: SqliteGamesServiceImpl(
        gamesSqliteRepository: SqliteGamesRepositoryImpl(
          sqliteConnectionFactory: SqliteConnectionFactory(),
        ),
      ),
    );
  });

  group(
    'GamesListGroupTests',
    () {
      test(
        'Should throw TooManyRequestsException when the statusCode is error',
        () async {
          // Arrange
          when(
            () => mockDio.post(
              baseGameUrl,
              data: '''
                fields id, name, platforms, summary, screenshots.url, genres.name, platforms.name;
                where platforms = $idPlatform;
                limit $limit;
                offset $offset;
              ''',
            ),
          ).thenThrow(
            DioException(
              requestOptions: RequestOptions(path: ''),
              response: Response(
                statusCode: 404,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
          // Act
          final call = gamesListRepositoryImpl.getGamesList;
          // Assert
          expect(
            () => call(
              limit: limit,
              offset: offset,
              idPlatform: idPlatform,
            ),
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );
    },
  );
}
