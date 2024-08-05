import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:game/app/core/text/text.dart';
import 'package:game/app/core/colors/colors.dart';
import 'package:game/app/widgets/widgets.dart';
import 'package:game/data/constants/constants.dart';
import 'package:game/data/models/game/game_model.dart';

class DetailsPage extends StatefulWidget {
  final GameModel game;

  const DetailsPage({
    super.key,
    required this.game,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final imageUrl = ConstantsAPI.http + widget.game.screenshots!;
    var bulletPoint = AppTexts.bulletPoint;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.game.name,
          style: AppTextStyles.appBar,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => const CustomErrorWidget(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppListColor.linearDetailsImage,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.1, 0.8, 1],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const CustomDivider(2),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Text(
                    widget.game.name,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.gameTitleDetails,
                  ),
                  const SizedBox(height: 8),
                  (widget.game.genres == null)
                      ? Text(
                          'There are no genres',
                          style: AppTextStyles.gameGenres,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.game.genres!
                              .map(
                                (game) => Text(
                                  '$bulletPoint ${game.name}',
                                  style: AppTextStyles.gameGenres,
                                ),
                              )
                              .toList(),
                        ),
                  const SizedBox(height: 2),
                  (widget.game.platforms == null)
                      ? Text(
                          'There are no plaforms available',
                          style: AppTextStyles.gamePlatforms,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.game.platforms!
                              .map(
                                (game) => Text(
                                  game.name,
                                  style: AppTextStyles.gameGenres,
                                ),
                              )
                              .toList(),
                        ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CustomDivider(1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      widget.game.summary ?? '',
                      style: AppTextStyles.gameDetails,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
