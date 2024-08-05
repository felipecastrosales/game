import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:game/app/core/text/app_texts.dart';
import 'package:game/data/datasource/database/sqlite/sqlite.dart';
import 'package:game/data/repositories/games/games.dart';
import 'package:game/data/repositories/sqlite/sqlite.dart';
import 'package:game/data/services/dio/dio.dart';
import 'package:game/data/services/games/games.dart';
import 'package:game/data/services/sqlite/sqlite.dart';

import 'config/pages/pages.dart';
import 'config/routes/routes.dart';
import 'core/theme/app_themes.dart';
import 'pages/home/bloc/home_page_bloc.dart';
import 'pages/home/home.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DioService>(
          create: (context) => DioServiceImpl(),
          lazy: false,
        ),
        Provider<SqliteConnectionFactory>(
          create: (context) => SqliteConnectionFactory(),
          lazy: false,
        ),
        Provider<SqliteGamesRepository>(
          create: (context) => SqliteGamesRepositoryImpl(
            sqliteConnectionFactory: context.read(),
          ),
          lazy: false,
        ),
        Provider<SqliteGamesService>(
          create: (context) => SqliteGamesServiceImpl(
            gamesSqliteRepository: context.read(),
          ),
          lazy: false,
        ),
        Provider<GamesListRepository>(
          create: (context) => GamesListRepositoryImpl(
            dioService: context.read(),
            sqliteGamesService: context.read(),
          ),
        ),
        Provider<GamesListService>(
          create: (context) => GamesListServiceImpl(
            gamesRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(
            context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => HomePageBloc(
            gamesRepository: context.read(),
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
