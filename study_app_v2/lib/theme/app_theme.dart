import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary Yellowish Palette (Premium proper)
  static const Color primary =
      Color(0xFFFACC15); // Vibrant Yellow (Home Featured)
  static const Color primaryAction =
      Color(0xFFFBBF24); // Action Color (Buttons)
  static const Color secondary =
      Color(0xFFD97706); // Amber/Golden (Badges/Text)

  // High-Fidelity Accent Colors
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentPurple = Color(0xFFA855F7);
  static const Color accentOrange = Color(0xFFF97316);
  static const Color accentGreen = Color(0xFF10B981);

  // Background & Surface
  static const Color bgLight = Color(0xFFF3F4F6); // Gray-tinted from Stitch
  static const Color bgCream =
      Color(0xFFF8F8F5); // Cream-tinted from Selection Wheel
  static const Color surface = Colors.white;

  // Dark Mode Tokens
  static const Color bgDark = Color(0xFF111827);
  static const Color bgWarmDark = Color(0xFF222110);
  static const Color surfaceDark = Color(0xFF1F2937);

  // Text
  static const Color textMain = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.bgLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.primaryAction,
        onPrimary: AppColors.textMain,
        surface: AppColors.surface,
        background: AppColors.bgLight,
      ),
      // Central typography system
      textTheme: GoogleFonts.plusJakartaSansTextTheme(const TextTheme(
        displayLarge: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.5),
        headlineMedium: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5),
        bodyLarge: TextStyle(color: AppColors.textMain),
        bodyMedium: TextStyle(color: AppColors.textSecondary),
      )),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textMain),
        titleTextStyle: TextStyle(
            color: AppColors.textMain,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.bgDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primary,
        surface: AppColors.surfaceDark,
        background: AppColors.bgDark,
      ),
      textTheme:
          GoogleFonts.plusJakartaSansTextTheme(ThemeData.dark().textTheme),
    );
  }
}
