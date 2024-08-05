import 'package:flutter/material.dart';

import 'package:game/app/core/colors/colors.dart';
import 'package:game/app/core/text/text.dart';
import 'package:game/app/pages/home/components/components.dart';

class CategoryTab extends StatelessWidget implements PreferredSizeWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorPadding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.label,
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      labelColor: AppColors.primary,
      labelStyle: AppTextStyles.categorySelected,
      unselectedLabelColor: AppColors.backgroundDark,
      unselectedLabelStyle: AppTextStyles.categoryUnselected,
      indicator: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      tabs: const [
        CategoryItem(AppTexts.xbox),
        CategoryItem(AppTexts.nintendo),
        CategoryItem(AppTexts.browser),
        CategoryItem(AppTexts.windows),
        CategoryItem(AppTexts.ps4),
      ],
    );
  }
}
