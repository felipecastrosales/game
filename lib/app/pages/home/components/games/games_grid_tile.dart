import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/core/text/app_text_styles.dart';
import 'package:game/app/pages/home/bloc/home_page_bloc.dart';
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

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.background,
                      border: Border.all(
                        color: AppColors.backgroundDark,
                        width: 2,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.backgroundDark,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) =>
                                DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            errorWidget: (_, __, ___) => const Center(
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                            placeholder: (_, __) => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            _games[index].name,
                            style: AppTextStyles.gameTitle,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
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
        );
      },
    );
  }
}
