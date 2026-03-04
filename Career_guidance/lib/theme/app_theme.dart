import 'package:flutter/material.dart';

class AppTheme {
  // Modern Color Palette
  static const _primaryColor = Color(0xFF6366F1); // Indigo
  static const _secondaryColor = Color(0xFF8B5CF6); // Purple
  static const _accentColor = Color(0xFF06B6D4); // Cyan

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryColor,
      primary: _primaryColor,
      secondary: _secondaryColor,
      tertiary: _accentColor,
      brightness: Brightness.light,
    );

    return ThemeData(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      useMaterial3: true,

      // Typography
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5),
        displayMedium: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.5),
        displaySmall: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0),
        headlineLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0),
        headlineMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0),
        headlineSmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0),
        titleLarge: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        titleMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
            height: 1.5),
        bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
            height: 1.5),
        bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.4,
            height: 1.5),
        labelLarge: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        labelMedium: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
        labelSmall: TextStyle(
            fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
          letterSpacing: 0,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.3),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle:
            TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 14),
        hintStyle: TextStyle(
            color: colorScheme.onSurfaceVariant.withOpacity(0.6), fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),

      // Filled Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          side: BorderSide(color: colorScheme.outline),
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),

      // FloatingActionButton Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryColor,
      primary: _primaryColor,
      secondary: _secondaryColor,
      tertiary: _accentColor,
      brightness: Brightness.dark,
    );

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      useMaterial3: true,

      // Typography
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5),
        displayMedium: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.5),
        displaySmall: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0),
        headlineLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0),
        headlineMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0),
        headlineSmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0),
        titleLarge: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        titleMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
            height: 1.5),
        bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
            height: 1.5),
        bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.4,
            height: 1.5),
        labelLarge: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        labelMedium: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
        labelSmall: TextStyle(
            fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
          letterSpacing: 0,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.3)),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.3),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle:
            TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 14),
        hintStyle: TextStyle(
            color: colorScheme.onSurfaceVariant.withOpacity(0.6), fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),

      // Filled Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          side: BorderSide(color: colorScheme.outline),
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),

      // FloatingActionButton Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
