/// Light theme configuration for the application
library;

import 'package:flutter/material.dart';

import 'theme_colors.dart';

/// Light theme data
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: LightColors.primary,
    onPrimary: LightColors.onPrimary,
    primaryContainer: LightColors.primaryContainer,
    onPrimaryContainer: LightColors.onPrimaryContainer,
    secondary: LightColors.secondary,
    onSecondary: LightColors.onSecondary,
    secondaryContainer: LightColors.secondaryContainer,
    onSecondaryContainer: LightColors.onSecondaryContainer,
    surface: LightColors.surface,
    onSurface: LightColors.onSurface,
    error: LightColors.error,
    onError: LightColors.onError,
  ),
  scaffoldBackgroundColor: LightColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: LightColors.primary,
    foregroundColor: LightColors.onPrimary,
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardThemeData(
    color: LightColors.surface,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: LightColors.primary,
    foregroundColor: LightColors.onPrimary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: LightColors.surface,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: LightColors.primary.withValues(alpha: 0.3)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: LightColors.primary, width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColors.primary,
      foregroundColor: LightColors.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);
