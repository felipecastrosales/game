import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/data/repositories/sqlite/sqlite_games_repository_impl.dart';
import 'package:provider/provider.dart';

import 'package:game/app/core/text/app_texts.dart';
import 'package:game/data/datasource/database/sqlite/sqlite.dart';
import 'package:game/data/repositories/games/games.dart';
import 'package:game/data/services/dio/dio.dart';
import 'package:game/data/services/games/games.dart';
import 'package:game/data/services/sqlite/sqlite_games_service_impl.dart';

import 'config/pages/pages.dart';
import 'config/routes/routes.dart';
import 'core/theme/app_themes.dart';
import 'pages/home/bloc/home_page_bloc.dart';
import 'pages/home/home_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => DioServiceImpl(),
        ),
        Provider<SqliteConnectionFactory>(
          create: (context) => SqliteConnectionFactory(),
          lazy: false,
        ),
        Provider<SqliteGamesRepositoryImpl>(
          create: (context) => SqliteGamesRepositoryImpl(
            sqliteConnectionFactory: context.read<SqliteConnectionFactory>(),
          ),
          lazy: false,
        ),
        Provider(
          create: (context) => SqliteGamesServiceImpl(
            gamesSqliteRepository: context.read<SqliteGamesRepositoryImpl>(),
          ),
          lazy: false,
        ),
        Provider<GamesListRepository>(
          create: (context) => GamesListRepositoryImpl(
            dioService: context.read<DioServiceImpl>(),
            sqliteGamesService: context.read<SqliteGamesServiceImpl>(),
          ),
        ),
        Provider<GamesListService>(
          create: (context) => GamesListServiceImpl(
            gamesRepository: context.read<GamesListRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => HomePageBloc(
            gamesRepository: context.read<GamesListRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(
            GamesListRepositoryImpl(
              dioService: context.read<DioServiceImpl>(),
              sqliteGamesService: context.read<SqliteGamesServiceImpl>(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: AppTexts.appTitleName,
        theme: AppThemes.light,
        initialRoute: Pages.home,
        routes: Routes.getRoutes(),
      ),
    );
  }
}
