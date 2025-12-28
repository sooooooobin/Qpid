import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 따뜻한 파스텔톤 컬러 팔레트
  static const Color primaryPeach = Color(0xFFFFB5A7);
  static const Color secondaryPink = Color(0xFFFCD5CE);
  static const Color warmCream = Color(0xFFFFF5EE);
  static const Color softCoral = Color(0xFFF8EDEB);
  static const Color accentRose = Color(0xFFE8A598);
  static const Color textDark = Color(0xFF5D4E4E);
  static const Color textLight = Color(0xFF8B7676);

  // 레벨별 컬러
  static const Color level1Color = Color(0xFF7FCDCD);
  static const Color level2Color = Color(0xFFFFB5A7);
  static const Color level3Color = Color(0xFFB88B8B);

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryPeach,
          brightness: Brightness.light,
          surface: warmCream,
        ),
        scaffoldBackgroundColor: warmCream,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          foregroundColor: textDark,
        ),
        textTheme: GoogleFonts.notoSansKrTextTheme().copyWith(
          // 큰 텍스트 - 멀리서도 가독성 좋게
          displayLarge: GoogleFonts.notoSansKr(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: textDark,
          ),
          headlineMedium: GoogleFonts.notoSansKr(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textDark,
          ),
          bodyLarge: GoogleFonts.notoSansKr(
            fontSize: 20,
            color: textDark,
          ),
          bodyMedium: GoogleFonts.notoSansKr(
            fontSize: 16,
            color: textDark,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryPeach,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: GoogleFonts.notoSansKr(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryPeach,
            side: const BorderSide(color: primaryPeach, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: GoogleFonts.notoSansKr(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  static Color getLevelColor(int level) {
    switch (level) {
      case 1:
        return level1Color;
      case 2:
        return level2Color;
      case 3:
        return level3Color;
      default:
        return primaryPeach;
    }
  }
}

