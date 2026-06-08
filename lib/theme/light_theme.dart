import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryLight,
    surface: AppColors.surfaceLight,
    onSurface: AppColors.onSurfaceLight,
    onSurfaceVariant: AppColors.onSurfaceVariantLight
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundLight,
    foregroundColor: AppColors.onSurfaceLight,
  ),

// MARK: - 1. --- Rail ---
   navigationRailTheme: NavigationRailThemeData(
    indicatorColor: AppColors.primaryLight.withAlpha(50),

    selectedIconTheme: const IconThemeData(
      color: AppColors.primaryLight,
    ),
    unselectedIconTheme: const IconThemeData(
      color: AppColors.onSurfaceVariantLight,
    ),
  ),

// 2. --- Bottom Bar ---
navigationBarTheme: NavigationBarThemeData(
    indicatorColor: AppColors.primaryLight.withAlpha(80),
    // 1. Icons
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
      if (states.contains(WidgetState.selected) || states.contains(WidgetState.hovered)) {
        return const IconThemeData(color: AppColors.primaryLight); // Leuchtendes Violett
      }
      return const IconThemeData(color: AppColors.onSurfaceVariantLight); // Grau
    }),
    // 2. Icon Text
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
      if (states.contains(WidgetState.selected) || states.contains(WidgetState.hovered)) {
        return const TextStyle(color: AppColors.primaryLight, fontWeight: FontWeight.w600);
      }
      return const TextStyle(color: AppColors.onSurfaceVariantLight);
    }),
  ),
);