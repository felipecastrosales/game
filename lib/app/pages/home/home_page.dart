// import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/core/text/text.dart';
import 'package:game/app/utils/utils.dart';
import 'package:game/data/models/game/game_model.dart';
import 'package:game/data/repositories/games/games.dart';
import 'package:game/data/services/dio/dio.dart';

import 'bloc/home_page_bloc.dart';
import 'components/components.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc xbox;
  late HomePageBloc nintendo;
  late HomePageBloc browser;
  late HomePageBloc playStation;
  late HomePageBloc pc;

  // ignore: unused_field
  final _games = <GameModel>[];

  final _controller = HomeController(
    GamesListRepositoryImpl(
      dioService: DioServiceImpl(),
    ),
  );

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ignore: unused_local_variable
      var controller = _controller.fetch();
      // developer.log(controller.toString());
    });
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
              games: _games,
              homePageBloc: xbox,
              listener: _controller.handleStateUpdate,
              idPlatform: 49,
            ),
            GamesTabItem(
              bloc: nintendo,
              games: _games,
              homePageBloc: nintendo,
              listener: _controller.handleStateUpdate,
              idPlatform: 130,
            ),
            GamesTabItem(
              bloc: pc,
              games: _games,
              homePageBloc: pc,
              listener: _controller.handleStateUpdate,
              idPlatform: 6,
            ),
            GamesTabItem(
              bloc: browser,
              games: _games,
              homePageBloc: browser,
              listener: _controller.handleStateUpdate,
              idPlatform: 82,
            ),
            GamesTabItem(
              bloc: playStation,
              games: _games,
              homePageBloc: playStation,
              listener: _controller.handleStateUpdate,
              idPlatform: 48,
            ),
          ],
        ),
      ),
    );
  }
}
