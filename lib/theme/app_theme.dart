import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlack = Color(0xFF0A0A0A);
  static const Color secondaryBlack = Color(0xFF1A1A1A);
  static const Color darkGrey = Color(0xFF2A2A2A);
  static const Color lightGrey = Color(0xFF666666);
  static const Color primaryBlue = Color(0xFF4A90E2);
  static const Color accentBlue = Color(0xFF357ABD);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFFE0E0E0);
  static const Color redAccent = Color(0xFFE74C3C);
  static const Color greenAccent = Color(0xFF2ECC71);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryBlue,
      scaffoldBackgroundColor: primaryBlack,
      appBarTheme: const AppBarTheme(
        backgroundColor: secondaryBlack,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: lightText,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: lightText,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: lightGrey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryBlue,
          side: const BorderSide(color: primaryBlue),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: secondaryBlack,
        selectedItemColor: primaryBlue,
        unselectedItemColor: lightGrey,
      ),
    );
  }
}
