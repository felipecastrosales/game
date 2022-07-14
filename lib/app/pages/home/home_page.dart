// import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/core/colors/colors.dart';
import 'package:game/app/core/text/text.dart';
import 'package:game/app/utils/utils.dart';
import 'package:game/data/models/game/game_model.dart';
import 'package:game/data/repositories/games/games.dart';

import 'bloc/home_page_bloc.dart';
import 'components/components.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc xbox;
  late HomePageBloc nintendo;
  late HomePageBloc browser;
  late HomePageBloc playStation;
  late HomePageBloc pc;

  final _games = <GameModel>[];

  // final controller = HomeController(
  //   GamesListRepositoryImpl(
  //     dioService: DioServiceImpl(),
  //     sqliteGamesService: SqliteGamesServiceImpl(
  //       gamesSqliteRepository: SqliteGamesRepositoryImpl(
  //         sqliteConnectionFactory: SqliteConnectionFactory(),
  //       ),
  //     ),
  //   ),
  // );

  @override
  void initState() {
    super.initState();
    xbox = HomePageBloc(
      gamesRepository: context.read<GamesListRepository>(),
    )..add(GamesListEventUtils.xbox);
    nintendo = HomePageBloc(
      gamesRepository: context.read<GamesListRepository>(),
    )..add(GamesListEventUtils.nintendo);
    browser = HomePageBloc(
      gamesRepository: context.read<GamesListRepository>(),
    )..add(GamesListEventUtils.browser);
    pc = HomePageBloc(
      gamesRepository: context.read<GamesListRepository>(),
    )..add(GamesListEventUtils.pc);
    playStation = HomePageBloc(
      gamesRepository: context.read<GamesListRepository>(),
    )..add(GamesListEventUtils.playStation);
  }

  @override
  void dispose() {
    xbox.close();
    nintendo.close();
    browser.close();
    pc.close();
    playStation.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppTexts.appTitleName,
            style: AppTextStyles.appBar,
          ),
          elevation: 0,
          bottom: const CategoryTab(),
        ),
        body: TabBarView(
          children: [
            GamesTabItem(
              bloc: xbox,
              listener: widget.controller.handleStateUpdate,
              games: _games,
              idPlatform: 49,
            ),
            GamesTabItem(
              bloc: nintendo,
              listener: widget.controller.handleStateUpdate,
              games: _games,
              idPlatform: 130,
            ),
            GamesTabItem(
              bloc: pc,
              listener: widget.controller.handleStateUpdate,
              games: _games,
              idPlatform: 6,
            ),
            GamesTabItem(
              bloc: browser,
              listener: widget.controller.handleStateUpdate,
              games: _games,
              idPlatform: 82,
            ),
            GamesTabItem(
              bloc: playStation,
              listener: widget.controller.handleStateUpdate,
              games: _games,
              idPlatform: 48,
            ),
          ],
        ),
      ),
    );
  }
}
