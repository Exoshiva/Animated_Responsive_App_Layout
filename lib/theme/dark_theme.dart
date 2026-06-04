import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.backgroundDark,
  scaffoldBackgroundColor: AppColors.textDark,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundDark,
    foregroundColor: AppColors.textDark,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textDark),
    bodyMedium: TextStyle(color: AppColors.backgroundDark),
  )
);