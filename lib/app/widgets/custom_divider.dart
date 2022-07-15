import 'package:flutter/material.dart';

import 'package:game/app/core/colors/colors.dart';

class CustomDivider extends StatelessWidget {
  final double height;

  const CustomDivider(
    this.height, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: AppColors.greyOpacity,
    );
  }
}
