/// Dark theme configuration for the application
library;

import 'package:flutter/material.dart';

import 'theme_colors.dart';

/// Dark theme data
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: DarkColors.primary,
    onPrimary: DarkColors.onPrimary,
    primaryContainer: DarkColors.primaryContainer,
    onPrimaryContainer: DarkColors.onPrimaryContainer,
    secondary: DarkColors.secondary,
    onSecondary: DarkColors.onSecondary,
    secondaryContainer: DarkColors.secondaryContainer,
    onSecondaryContainer: DarkColors.onSecondaryContainer,
    surface: DarkColors.surface,
    onSurface: DarkColors.onSurface,
    error: DarkColors.error,
    onError: DarkColors.onError,
  ),
  scaffoldBackgroundColor: DarkColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: DarkColors.surface,
    foregroundColor: DarkColors.onSurface,
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardThemeData(
    color: DarkColors.surface,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: DarkColors.primary,
    foregroundColor: DarkColors.onPrimary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: DarkColors.surface,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: DarkColors.primary.withValues(alpha: 0.3)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: DarkColors.primary, width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkColors.primary,
      foregroundColor: DarkColors.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);
