import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryDark,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.onSurfaceDark,
    onSurfaceVariant: AppColors.onSurfaceVariantDark
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundDark,
    foregroundColor: AppColors.onSurfaceDark,
  ),

// MARK: 1. --- Rail ---
  navigationRailTheme: NavigationRailThemeData(
    indicatorColor: AppColors.primaryLight.withAlpha(80),

    selectedIconTheme: const IconThemeData(
      color: AppColors.primaryDark,
    ),
    unselectedIconTheme: const IconThemeData(
      color: AppColors.onSurfaceVariantDark,
      ),
    ),

// 2. --- Bottom Bar ---
navigationBarTheme: NavigationBarThemeData(
    indicatorColor: AppColors.primaryDark.withAlpha(80),
    // 1. Icons
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
      if (states.contains(WidgetState.selected) || states.contains(WidgetState.hovered)) {
        return const IconThemeData(color: AppColors.primaryDark); // Leuchtendes Violett
      }
      return const IconThemeData(color: AppColors.onSurfaceVariantDark); // Grau
    }),
    // 2. Icon Text
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
      if (states.contains(WidgetState.selected) || states.contains(WidgetState.hovered)) {
        return const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w600);
      }
      return const TextStyle(color: AppColors.onSurfaceVariantDark);
    }),
  ),
);
