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
    tertiary: LightColors.tertiary,
    onTertiary: LightColors.onTertiary,
    surface: LightColors.surface,
    onSurface: LightColors.onSurface,
    surfaceContainerHighest: LightColors.surfaceContainerHighest,
    outline: LightColors.outline,
    error: LightColors.error,
    onError: LightColors.onError,
  ),
  scaffoldBackgroundColor: LightColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: LightColors.surface,
    foregroundColor: LightColors.onSurface,
    elevation: 0,
    scrolledUnderElevation: 1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: LightColors.onSurface,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
    ),
  ),
  cardTheme: CardThemeData(
    color: LightColors.surface,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    surfaceTintColor: Colors.transparent,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: LightColors.primary,
    foregroundColor: LightColors.onPrimary,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: LightColors.surfaceContainerHighest,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      borderSide: BorderSide(color: LightColors.primary, width: 2),
    ),
    floatingLabelStyle: TextStyle(
      color: LightColors.primary,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColors.primary,
      foregroundColor: LightColors.onPrimary,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
  ),
  dialogTheme: DialogThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 4,
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  ),
  dividerTheme: DividerThemeData(
    color: LightColors.outline.withValues(alpha: 0.3),
    thickness: 1,
    space: 0,
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: LightColors.surface,
    indicatorColor: LightColors.primaryContainer,
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TextStyle(
          color: LightColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        );
      }
      return TextStyle(
        color: LightColors.onSurface.withValues(alpha: 0.6),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return IconThemeData(color: LightColors.primary, size: 24);
      }
      return IconThemeData(
        color: LightColors.onSurface.withValues(alpha: 0.6),
        size: 24,
      );
    }),
  ),
);
