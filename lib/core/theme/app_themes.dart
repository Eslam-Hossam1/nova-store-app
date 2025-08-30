import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    dialogBackgroundColor: AppColors.dialogBackground,
    textTheme: GoogleFonts.interTextTheme(),
    colorScheme: const ColorScheme.light(
      primary: AppColors.purple,
      onPrimary: AppColors.white,
      secondary: AppColors.yellow,
      onSecondary: AppColors.darkPurple,
      surface: AppColors.white,
      onSurface: AppColors.darkGray,
      error: AppColors.red,
      onError: AppColors.white,
      outline: AppColors.grayLight,
    ),
  );
}
