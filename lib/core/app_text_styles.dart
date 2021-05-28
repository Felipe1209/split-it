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
    color: AppColors.buttons,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}