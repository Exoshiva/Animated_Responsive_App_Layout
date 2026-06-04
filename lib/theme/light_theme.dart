import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryLight,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  appBarTheme: AppBarTheme(
    backgroundColor:AppColors.primaryLight,
    foregroundColor: AppColors.textLight, 
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textLight),
    bodyMedium: TextStyle(color: AppColors.textLight),
  ),
);