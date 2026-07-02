import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';

class AppTheme {
  static TextTheme _buildTextTheme({required bool isDarkMode}) {
    final textColor = isDarkMode ? const Color(0xFFD6D6D6) : Colors.black;
    return GoogleFonts.nunitoTextTheme().copyWith(
      displayLarge: GoogleFonts.nunito(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      displayMedium: GoogleFonts.nunito(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      displaySmall: GoogleFonts.nunito(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      headlineLarge: GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineSmall: GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleLarge: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleMedium: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textColor,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: textColor,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.4,
      ),
      labelLarge: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.nunito(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 0.5,
      ),
    );
  }

  static ThemeData light({Color seedColor = AppColors.seed}) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
      error: Colors.red,
      surface: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(isDarkMode: false),
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: const WidgetStatePropertyAll(true),
        thumbColor: WidgetStatePropertyAll(colorScheme.primary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(colorScheme.onSurface),
        ),
      ),
      dividerColor: colorScheme.outlineVariant,
    );
  }

  static ThemeData dark({Color seedColor = AppColors.seed}) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
      error: Colors.red,
      surface: Color(0xFF121212),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(isDarkMode: true),
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: const WidgetStatePropertyAll(true),
        thumbColor: WidgetStatePropertyAll(colorScheme.primary),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      dividerColor: colorScheme.outlineVariant,
    );
  }
}
