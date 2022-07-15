import 'package:flutter/material.dart';
import 'package:game/app/core/colors/colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.backgroundDark,
      ),
      child: const Icon(
        Icons.sync_problem,
        size: 50,
        color: AppColors.grey,
      ),
    );
  }
}
