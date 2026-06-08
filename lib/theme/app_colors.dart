import 'package:flutter/material.dart';

/// Central Color Palette
class AppColors {
  // Cooperate-Identity:Colors (for Light and Dark)
  static const Color brandYellow = Color.fromARGB(255, 255, 208, 0);

  // --- Light Mode Colors ---
  static const Color primaryLight = Color(0xFF6750A4); // Kräftiges Violett
  static const Color backgroundLight = Color(0xFFF4F3F7); // Leicht gebrochenes Weiß für weicheren Hintergrund
  static const Color surfaceLight = Colors.white; // Strahlendes Weiß für die Karten
  static const Color onSurfaceLight = Color(0xFF1C1B1F); // Fast-Schwarz für maximale Lesbarkeit
  static const Color onSurfaceVariantLight = Color(0xFF49454F); // Gedimmtes Grau für sekundäre Texte

  // --- Dark Mode Colors ---
  static const Color primaryDark = Color(0xFFD0BCFF); // Helleres Violett (besserer Kontrast auf Dunkel)
  static const Color backgroundDark = Color(0xFF141218); // Sehr tiefes Grau/Schwarz für die unterste Ebene
  static const Color surfaceDark = Color(0xFF2A2731); // Dunkel Violett-Grau für die Karten
  static const Color onSurfaceDark = Color(0xFFE6E1E5); // Klares Weiß-Grau für Haupttexte
  static const Color onSurfaceVariantDark = Color(0xFFCAC4D0); // Gedimmtes Grau für Platzhalter
}