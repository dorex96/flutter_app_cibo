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
    tertiary: DarkColors.tertiary,
    onTertiary: DarkColors.onTertiary,
    surface: DarkColors.surface,
    onSurface: DarkColors.onSurface,
    surfaceContainerHighest: DarkColors.surfaceContainerHighest,
    outline: DarkColors.outline,
    error: DarkColors.error,
    onError: DarkColors.onError,
  ),
  scaffoldBackgroundColor: DarkColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: DarkColors.surface,
    foregroundColor: DarkColors.onSurface,
    elevation: 0,
    scrolledUnderElevation: 1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: DarkColors.onSurface,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
    ),
  ),
  cardTheme: CardThemeData(
    color: DarkColors.surface,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    surfaceTintColor: Colors.transparent,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: DarkColors.primary,
    foregroundColor: DarkColors.onPrimary,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: DarkColors.surfaceContainerHighest,
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
      borderSide: BorderSide(color: DarkColors.primary, width: 2),
    ),
    floatingLabelStyle: TextStyle(
      color: DarkColors.primary,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkColors.primary,
      foregroundColor: DarkColors.onPrimary,
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
    color: DarkColors.outline.withValues(alpha: 0.3),
    thickness: 1,
    space: 0,
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: DarkColors.surface,
    indicatorColor: DarkColors.primaryContainer,
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TextStyle(
          color: DarkColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        );
      }
      return TextStyle(
        color: DarkColors.onSurface.withValues(alpha: 0.6),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return IconThemeData(color: DarkColors.primary, size: 24);
      }
      return IconThemeData(
        color: DarkColors.onSurface.withValues(alpha: 0.6),
        size: 24,
      );
    }),
  ),
);
