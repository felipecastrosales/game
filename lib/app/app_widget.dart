import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/app/core/text/app_texts.dart';
import 'package:provider/provider.dart';

import 'package:game/data/repositories/games/games.dart';
import 'package:game/data/services/dio/dio.dart';
import 'package:game/data/services/games/games.dart';

import 'config/pages/pages.dart';
import 'config/routes/routes.dart';
import 'core/theme/app_themes.dart';
import 'pages/home/bloc/home_page_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {},
        ),
        Provider(
          create: (context) => DioServiceImpl(),
        ),
        Provider<GamesListRepository>(
          create: (context) => GamesListRepositoryImpl(
            dioService: context.read<DioService>(),
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
