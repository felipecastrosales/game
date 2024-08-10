import 'package:flutter/material.dart';
import 'package:game/app/core/colors/colors.dart';
import 'package:game/app/core/text/text.dart';

class AppThemes {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: Colors.blue,
      tabBarTheme: const TabBarTheme(
        labelPadding: EdgeInsets.all(4),
        tabAlignment: TabAlignment.start,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTextStyles.appBar,
        elevation: 0,
        actionsIconTheme: const IconThemeData(
          color: AppColors.textLight,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textLight,
        ),
      ),
    );
  }
}
