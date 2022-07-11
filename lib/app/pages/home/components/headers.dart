import 'package:flutter/material.dart';

import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/core/text/text.dart';

class Headers extends StatelessWidget {
  final String title;
  final IconData icon;

  const Headers({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: AppTextStyles.headers,
            ),
          ),
          const Spacer(),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.backgroundDark,
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.background,
                  AppColors.backgroundDark,
                ],
              ),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
