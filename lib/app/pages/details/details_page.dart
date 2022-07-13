import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:game/app/core/text/text.dart';
import 'package:game/app/widgets/custom_divider.dart';
import 'package:game/data/constants/constants_api.dart';
import 'package:game/data/models/game/game_model.dart';

class DetailsPage extends StatefulWidget {
  final GameModel game;

  const DetailsPage({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final imageUrl = ConstantsAPI.http + widget.game.screenshots!;
    String bulletPoint = '\u2022';

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
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                // imageBuilder: (context, imageProvider) => Container(),
                errorWidget: (_, __, ___) => const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
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
                    style: AppTextStyles.gameTitle,
                  ),
                  const SizedBox(height: 8),
                  (widget.game.genres == null)
                      ? const Text('There are no genres.')
                      : Column(
                          children: widget.game.genres!
                              .map(
                                (game) => Text(
                                  '$bulletPoint ${game.name}',
                                  style: AppTextStyles.gameDetails,
                                ),
                              )
                              .toList(),
                        ),
                  const SizedBox(height: 16),
                  Text(
                    widget.game.summary!,
                    style: AppTextStyles.gameDetails,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
