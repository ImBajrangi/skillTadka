import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SacredStyles {
  // Memoized Text Styles to prevent expensive GoogleFonts rebuilds
  static final TextStyle inter18Bold = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle inter20Bold = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle mono12 = GoogleFonts.robotoMono(
    fontSize: 12,
  );

  static final TextStyle inter24Bold = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle mono14Bold = GoogleFonts.robotoMono(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  static final TextStyle mono10Bold = GoogleFonts.robotoMono(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );

  static final TextStyle mono12Bold = GoogleFonts.robotoMono(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
  );

  static final TextStyle inter16 = GoogleFonts.inter(
    fontSize: 16,
  );

  static final TextStyle inter14 = GoogleFonts.inter(
    fontSize: 14,
  );

  static final TextStyle inter12 = GoogleFonts.inter(
    fontSize: 12,
  );

  static final TextStyle inter10Bold = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle display32Bold = GoogleFonts.robotoMono(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.0,
  );

  static final TextStyle headline24SemiBold = GoogleFonts.robotoMono(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  // Helper to get themed color for a style
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }
}
