import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  static TextStyle get displayLarge => GoogleFonts.merriweather(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get displayMedium => GoogleFonts.merriweather(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.25,
      );

  static TextStyle get headlineLarge => GoogleFonts.merriweather(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get headlineMedium => GoogleFonts.lato(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyLarge => GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  static TextStyle get bodyMedium => GoogleFonts.lato(
        fontSize: 14,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.lato(
        fontSize: 12,
        color: AppColors.textHint,
      );

  static TextStyle get labelButton => GoogleFonts.lato(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
      );

  static TextStyle get optionLabel => GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.4,
      );
}
