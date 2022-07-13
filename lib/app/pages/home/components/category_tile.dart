import 'package:flutter/material.dart';

import 'package:game/app/core/colors/colors.dart';
import 'package:game/app/core/text/text.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTile({
    Key? key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorSelected =
        isSelected ? AppColors.primaryLight : AppColors.backgroundDark;
    var borderSelected =
        isSelected ? AppColors.primary : AppColors.backgroundDark;
    var styleSelected = isSelected
        ? AppTextStyles.categorySelected
        : AppTextStyles.categoryUnselected;

    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: colorSelected,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: borderSelected,
              width: 1.8,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.backgroundDark,
                blurRadius: 1,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            child: Text(
              name,
              style: styleSelected,
            ),
          ),
        ),
      ),
    );
  }
}
