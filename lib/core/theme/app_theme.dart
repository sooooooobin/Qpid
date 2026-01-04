import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 메인 컬러: 코랄 핑크 (#FF7F50)
  static const Color primaryCoral = Color(0xFFFF7F50);
  static const Color primaryTerracotta = Color(0xFFE07A5F);
  
  // 배경 컬러: 크림색 (#FFFDD0)
  static const Color creamBackground = Color(0xFFFFFDD0);
  static const Color creamBackgroundDark = Color(0xFF1A1A1A);
  
  // 서브 컬러
  static const Color secondaryCream = Color(0xFFFFF8E1);
  static const Color softCoral = Color(0xFFFFE5D9);
  
  // 텍스트 컬러: 다크 그레이
  static const Color textDark = Color(0xFF2C2C2C);
  static const Color textLight = Color(0xFF666666);
  static const Color textDarkMode = Color(0xFFE0E0E0);
  static const Color textLightDarkMode = Color(0xFFB0B0B0);

  // 레벨별 컬러
  static const Color level1Color = Color(0xFF7FCDCD);
  static const Color level2Color = Color(0xFFFF7F50);
  static const Color level3Color = Color(0xFFE07A5F);

  // 둥근 폰트 (나눔라운드 또는 프리텐다드 스타일)
  static TextStyle _roundedFont(double fontSize, FontWeight weight, Color color) {
    return GoogleFonts.notoSansKr(
      fontSize: fontSize,
      fontWeight: weight,
      color: color,
      letterSpacing: -0.5,
    );
  }

  // 본문 폰트 (고딕체)
  static TextStyle _bodyFont(double fontSize, Color color) {
    return GoogleFonts.notoSansKr(
      fontSize: fontSize,
      color: color,
    );
  }

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCoral,
          brightness: Brightness.light,
          surface: creamBackground,
        ),
        scaffoldBackgroundColor: creamBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          foregroundColor: textDark,
        ),
        textTheme: TextTheme(
          // 제목: 둥근 폰트
          displayLarge: _roundedFont(32, FontWeight.bold, textDark),
          headlineMedium: _roundedFont(24, FontWeight.w600, textDark),
          titleLarge: _roundedFont(20, FontWeight.w600, textDark),
          // 본문: 고딕체
          bodyLarge: _bodyFont(20, textDark),
          bodyMedium: _bodyFont(16, textDark),
          bodySmall: _bodyFont(14, textLight),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryCoral,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
            shadowColor: primaryCoral.withOpacity(0.3),
            textStyle: _roundedFont(18, FontWeight.w600, Colors.white),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryCoral,
            side: const BorderSide(color: primaryCoral, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: _roundedFont(18, FontWeight.w600, primaryCoral),
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCoral,
          brightness: Brightness.dark,
          surface: creamBackgroundDark,
        ),
        scaffoldBackgroundColor: creamBackgroundDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          foregroundColor: textDarkMode,
        ),
        textTheme: TextTheme(
          displayLarge: _roundedFont(32, FontWeight.bold, textDarkMode),
          headlineMedium: _roundedFont(24, FontWeight.w600, textDarkMode),
          titleLarge: _roundedFont(20, FontWeight.w600, textDarkMode),
          bodyLarge: _bodyFont(20, textDarkMode),
          bodyMedium: _bodyFont(16, textDarkMode),
          bodySmall: _bodyFont(14, textLightDarkMode),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryCoral,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
            shadowColor: primaryCoral.withOpacity(0.3),
            textStyle: _roundedFont(18, FontWeight.w600, Colors.white),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryCoral,
            side: const BorderSide(color: primaryCoral, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: _roundedFont(18, FontWeight.w600, primaryCoral),
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF2C2C2C),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
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
        return primaryCoral;
    }
  }
}

