import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:game/app/core/colors/colors.dart';

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

  static final categorySelected = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static final categoryUnselected = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static final gameTitle = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static final gameTitleDetails = GoogleFonts.nunito(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static final gameGenres = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );


  static final gamePlatforms = GoogleFonts.nunito(
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: AppColors.text,
  );


  static final gameDetails = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );
}
