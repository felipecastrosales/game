// import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:game/app/config/pages/pages.dart';
import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/core/text/app_text_styles.dart';
import 'package:game/app/widgets/custom_divider.dart';
import 'package:game/data/models/game/game_model.dart';
import 'package:game/data/repositories/games/games.dart';
import 'package:game/data/services/dio/dio.dart';

import 'components/components.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ignore: unused_local_variable
      var controller = _controller.fetch();
      // developer.log(controller.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Game App',
          style: AppTextStyles.appBar,
        ),
      ),
      body: Column(
        children: [
          const Headers(
            title: 'Categorias',
            icon: Icons.category,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return CategoryTile(
                  name: 'Game $index',
                  isSelected: true,
                  onTap: () {},
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomDivider(2),
          ),
          const Headers(
            title: 'Jogos',
            icon: Icons.videogame_asset,
          ),
          // Expanded(
          //   child: ValueListenableBuilder<List<GameModel?>>(
          //     valueListenable: _controller.games,
          //     builder: (_, games, __) {
          //       return ListView.separated(
          //         physics: const NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         itemCount: _games.length,
          //         separatorBuilder: (_, __) => const Divider(),
          //         itemBuilder: (_, index) {
          //           return CustomListCardWidget(
          //             game: _games[index],
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 4 / 5,
                ),
                itemBuilder: (context, index) {
                  return GameTile(
                    image: '$index',
                    text: 'Game $index',
                    onTap: () {
                      Navigator.pushNamed(context, Pages.details);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
