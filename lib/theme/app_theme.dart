import 'package:flutter/material.dart';

class AppColors {
  // Ana palet
  static const Color cream = Color(0xFFFAF8F5);
  static const Color bej = Color(0xFFEDE8DF);
  static const Color gold = Color(0xFFC9A84C);
  static const Color goldLight = Color(0xFFF5EDD6);
  static const Color olive = Color(0xFF2D3B2D);
  static const Color oliveMid = Color(0xFF4A5C4A);
  static const Color oliveSoft = Color(0xFF8A9E8A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textMid = Color(0xFF6B6B6B);
  static const Color textSoft = Color(0xFFADADAD);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFEDE8DF);
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: const ColorScheme.light(
          primary: AppColors.olive,
          secondary: AppColors.gold,
          surface: AppColors.cardBg,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.cream,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
            letterSpacing: -0.5,
          ),
          iconTheme: IconThemeData(color: AppColors.textDark),
        ),
        cardTheme: CardThemeData(
          color: AppColors.cardBg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
            letterSpacing: -1,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
          titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
            letterSpacing: -0.2,
          ),
          bodyMedium: TextStyle(
            fontSize: 13,
            color: AppColors.textMid,
            height: 1.5,
          ),
          labelSmall: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.textSoft,
            letterSpacing: 0.8,
          ),
        ),
      );
}
