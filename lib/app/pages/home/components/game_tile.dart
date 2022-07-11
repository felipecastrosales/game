import 'package:flutter/material.dart';

import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/core/text/app_text_styles.dart';

class GameTile extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  const GameTile({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(1),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.backgroundDark,
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
                      child: Placeholder(
                        child: Center(
                          child: Text(image),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.gameTitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
