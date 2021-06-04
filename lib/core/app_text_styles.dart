import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/core/app_colors.dart';

class AppTextStyles{
  static final TextStyle loginTitle = GoogleFonts.montserrat(
    color: AppColors.greenPrimary,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle loginButtons = GoogleFonts.inter(
    color: AppColors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle appBar = GoogleFonts.montserrat(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle infoCardTitle = GoogleFonts.inter(
    color: AppColors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle infoCardReceive = GoogleFonts.inter(
    color: AppColors.greenPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle infoCardGive = GoogleFonts.inter(
    color: AppColors.redPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}