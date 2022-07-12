import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/core/text/app_text_styles.dart';

class GamesCardItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const GamesCardItem({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              imageBuilder: (context, imageProvider) => DecoratedBox(
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
              title,
              style: AppTextStyles.gameTitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
