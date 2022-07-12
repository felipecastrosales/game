import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/pages/home/bloc/home_page_bloc.dart';
import 'package:game/data/constants/constants_api.dart';
import 'package:game/data/models/game/game_model.dart';

class GamesGridTile extends StatefulWidget {
  const GamesGridTile(
    this.homePageBloc, {
    required this.idPlatform,
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
    final double sizeWidth = MediaQuery.of(context).size.width;
    final double sizeHeight = MediaQuery.of(context).size.height;

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
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: sizeWidth * .02,
                      mainAxisSpacing: sizeWidth * .02,
                    ),
                    itemCount: _games.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: sizeWidth * .1,
                        height: sizeWidth * .1,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: ConstantsAPI.http +
                                  _games[index].screenshots!,
                              width: sizeWidth,
                              fit: BoxFit.fill,
                              errorWidget: (_, __, ___) => const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: sizeWidth * .1),
                                Container(
                                  width: sizeWidth,
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    _games[index].name,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(height: sizeHeight * .05),
                _games.isEmpty
                    ? const SizedBox.shrink()
                    : InkWell(
                        onTap: () {
                          widget.homePageBloc.add(
                            GamesListEvent(
                              limit: _games.length + 10,
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
            ),
          ),
        );
      },
    );
  }
}
