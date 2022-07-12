import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class _GamesGridTileState extends State<GamesGridTile> {
  final _games = <GameModel>[];

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
                      widget.homePageBloc.add(
                        GamesListEvent(
                          limit: _games.length + 6,
                          offset: _games.length,
                          idPlatform: widget.idPlatform,
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.add, size: 30),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
