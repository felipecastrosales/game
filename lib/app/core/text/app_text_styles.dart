import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:game/app/core/colors/app_colors.dart';

class AppTextStyles {
  static final appBar = GoogleFonts.nunito(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColors.textLight,
  );

  static final headers = GoogleFonts.notoSansJavanese(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
}
