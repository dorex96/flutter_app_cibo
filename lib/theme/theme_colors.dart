/// Color definitions for light and dark themes
library;

import 'package:flutter/material.dart';

/// Light theme color palette
abstract final class LightColors {
  /// Primary brand color
  static const Color primary = Color(0xFF4CAF50);

  /// Color for content on primary
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Primary container color
  static const Color primaryContainer = Color(0xFFC8E6C9);

  /// Color for content on primary container
  static const Color onPrimaryContainer = Color(0xFF1B5E20);

  /// Secondary brand color
  static const Color secondary = Color(0xFF03A9F4);

  /// Color for content on secondary
  static const Color onSecondary = Color(0xFFFFFFFF);

  /// Secondary container color
  static const Color secondaryContainer = Color(0xFFB3E5FC);

  /// Color for content on secondary container
  static const Color onSecondaryContainer = Color(0xFF01579B);

  /// Background color
  static const Color background = Color(0xFFF5F5F5);

  /// Surface color
  static const Color surface = Color(0xFFFFFFFF);

  /// Color for content on surface
  static const Color onSurface = Color(0xFF212121);

  /// Error color
  static const Color error = Color(0xFFD32F2F);

  /// Color for content on error
  static const Color onError = Color(0xFFFFFFFF);
}

/// Dark theme color palette
abstract final class DarkColors {
  /// Primary brand color
  static const Color primary = Color(0xFF81C784);

  /// Color for content on primary
  static const Color onPrimary = Color(0xFF1B5E20);

  /// Primary container color
  static const Color primaryContainer = Color(0xFF2E7D32);

  /// Color for content on primary container
  static const Color onPrimaryContainer = Color(0xFFC8E6C9);

  /// Secondary brand color
  static const Color secondary = Color(0xFF4FC3F7);

  /// Color for content on secondary
  static const Color onSecondary = Color(0xFF01579B);

  /// Secondary container color
  static const Color secondaryContainer = Color(0xFF0277BD);

  /// Color for content on secondary container
  static const Color onSecondaryContainer = Color(0xFFB3E5FC);

  /// Background color
  static const Color background = Color(0xFF121212);

  /// Surface color
  static const Color surface = Color(0xFF1E1E1E);

  /// Color for content on surface
  static const Color onSurface = Color(0xFFE0E0E0);

  /// Error color
  static const Color error = Color(0xFFEF5350);

  /// Color for content on error
  static const Color onError = Color(0xFF000000);
}
