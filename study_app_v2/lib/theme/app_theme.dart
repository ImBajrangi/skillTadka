import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // skillTadka Hub Palette (Stitch Template Exact Match)
  static const Color primary = Color(0xFF22C55E); // Emerald Glow
  static const Color primaryAction = Color(0xFF15803D); // Forest Dark
  static const Color secondary = Color(0xFF34D399); // Soft Teal Accent

  // Background & Surface (Stitch Dark Mode)
  static const Color bgDark = Color(0xFF111827); // Charcoal
  static const Color surface = Color(0xFF1F2937); // Slate Card
  static const Color border = Color(0xFF374151); // Slate Border
  static const Color surfaceDark = Color(0xFF111827); // Same as BG

  // Light Theme Palette (skillTadka Hub Light)
  static const Color bgCream = Color(0xFFFDFCF8); // Soft Light Background
  static const Color bgLight = bgCream; // Alias for compatibility
  static const Color surfaceLight = Color(0xFFFFFFFF); // Pure White Card
  static const Color borderLight = Color(0xFFE5E7EB); // Gray 200 Border

  // Text Tokens
  static const Color textMain = Color(0xFFF3F4F6); // Gray 100
  static const Color textSecondary = Color(0xFF9CA3AF); // Gray 400
  static const Color textOffWhite = Color(0xFFE5E7EB); // Gray 200

  static const Color textMainLight = Color(0xFF111827); // Dark Slate
  static const Color textSecondaryLight = Color(0xFF4B5563); // Gray 600

  // Glows & Shadows
  static const Color premiumGlow = Color(0x3322C55E);
  static const Color glassBorder = Color(0x1AFFFFFF);
  static const Color glassBorderLight = Color(0x1A000000);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF22C55E), Color(0xFF15803D)],
  );

  static List<BoxShadow> emeraldGlow = [
    BoxShadow(
      color: const Color(0xFF22C55E).withValues(alpha: 0.4),
      blurRadius: 10,
      offset: const Offset(0, 0),
    ),
  ];

  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.3),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];

  // Legacy/Reference (to be phased out)
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentPurple = Color(0xFFA855F7);
  static const Color accentOrange = Color(0xFFF97316);
}

class AppTheme {
  static const double borderRadius = 12.0;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.bgCream,
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLight,
        thickness: 1,
        space: 1,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.primaryAction,
        surface: AppColors.surfaceLight,
        onPrimary: Colors.white,
        onSurface: AppColors.textMainLight,
        outline: AppColors.borderLight,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.robotoMono(
          color: AppColors.textMainLight,
          fontWeight: FontWeight.bold,
          fontSize: 32,
          letterSpacing: -1.0,
        ),
        headlineMedium: GoogleFonts.robotoMono(
          color: AppColors.textMainLight,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        bodyLarge: GoogleFonts.inter(
          color: AppColors.textMainLight,
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.inter(
          color: AppColors.textSecondaryLight,
          fontSize: 14,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textMainLight),
        titleTextStyle: TextStyle(
          color: AppColors.textMainLight,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: const BorderSide(color: AppColors.borderLight, width: 1),
        ),
        elevation: 0,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.bgDark,
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primaryAction,
        surface: AppColors.surface,
        onPrimary: Colors.white,
        onSurface: AppColors.textMain,
        outline: AppColors.border,
      ),
      // Specialized Typography
      textTheme: TextTheme(
        displayLarge: GoogleFonts.robotoMono(
          color: AppColors.textMain,
          fontWeight: FontWeight.bold,
          fontSize: 32,
          letterSpacing: -1.0,
        ),
        headlineMedium: GoogleFonts.robotoMono(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        bodyLarge: GoogleFonts.inter(
          color: AppColors.textOffWhite,
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textMain),
        titleTextStyle: TextStyle(
          color: AppColors.textMain,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
        elevation: 0,
      ),
    );
  }
}
