import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'controls_themes.dart';

class ThemeSelector {
  static final ThemeData lightTheme = _buildTheme(Brightness.light);
  static final ThemeData darkTheme = _buildTheme(Brightness.dark);

  static ThemeData light() => lightTheme;

  static ThemeData dark() => darkTheme;

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    
    final colorScheme = isDark ? const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.primaryForeground,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryForeground,
      surface: AppColors.card,
      onSurface: AppColors.cardForeground,
      error: AppColors.destructive,
      onError: AppColors.destructiveForeground,
      outline: AppColors.border,
    ) : const ColorScheme.light(
      primary: AppColors.primaryLight,
      onPrimary: AppColors.primaryForegroundLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.secondaryForegroundLight,
      surface: AppColors.cardLight,
      onSurface: AppColors.cardForegroundLight,
      error: AppColors.error,
      onError: Colors.white,
      outline: AppColors.borderLight,
    );

    final textTheme = GoogleFonts.interTextTheme().apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: isDark ? AppColors.background : AppColors.backgroundLight,
      primaryColor: colorScheme.primary,
      colorScheme: colorScheme,
      textTheme: textTheme,
      cardTheme: ControlsThemes.cardTheme(colorScheme),
      elevatedButtonTheme: ControlsThemes.elevatedButtonTheme(colorScheme),
      inputDecorationTheme: ControlsThemes.inputDecorationTheme(colorScheme),
      dropdownMenuTheme: ControlsThemes.dropdownMenuTheme(colorScheme),
      appBarTheme: ControlsThemes.appBarTheme(colorScheme),
      bottomNavigationBarTheme: ControlsThemes.bottomNavigationBarTheme(colorScheme),
      chipTheme: ControlsThemes.chipTheme(colorScheme),
      floatingActionButtonTheme: ControlsThemes.floatingActionButtonTheme(
        colorScheme,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
