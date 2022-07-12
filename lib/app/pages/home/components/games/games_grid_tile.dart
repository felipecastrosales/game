import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/pages/home/bloc/home_page_bloc.dart';
import 'package:game/app/pages/home/components/components.dart';
import 'package:game/data/constants/constants_api.dart';
import 'package:game/data/models/game/game_model.dart';

class GamesGridTile extends StatefulWidget {
  const GamesGridTile(
    this.homePageBloc,
    this.idPlatform, {
    Key? key,
  }) : super(key: key);

  final HomePageBloc homePageBloc;
  final int idPlatform;

  @override
  State<GamesGridTile> createState() => _GamesGridTileState();
}

class _GamesGridTileState extends State<GamesGridTile>
    with SingleTickerProviderStateMixin {
  final _games = <GameModel>[];
  late AnimationController _animationController;
  bool expanded = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is HomePageLoading) {}
        if (state is HomePageError) {}
      },
      bloc: widget.homePageBloc,
      builder: (context, state) {
        if (state is HomePageSuccess) {
          _games.addAll(state.games);
        }
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 4 / 5,
                ),
                itemCount: _games.length,
                itemBuilder: (context, index) {
                  final imageUrl =
                      ConstantsAPI.http + _games[index].screenshots!;
                  final title = _games[index].name;

                  return GamesCardItem(
                    imageUrl: imageUrl,
                    title: title,
                  );
                },
              ),
            ),
            _games.isEmpty
                ? const SizedBox.shrink()
                : InkWell(
                    onTap: () {
                      setState(() {
                        expanded
                            ? _animationController.forward()
                            : _animationController.reverse();
                        expanded = !expanded;
                      });

                      widget.homePageBloc.add(
                        GamesListEvent(
                          limit: _games.length + 6,
                          offset: _games.length,
                          idPlatform: widget.idPlatform,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 24),
                      child: Center(
                        child: AnimatedIcon(
                          icon: AnimatedIcons.add_event,
                          progress: _animationController,
                          color: AppColors.dark,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
