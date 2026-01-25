import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../constants/theme_constants.dart';

part 'theme_state.dart';

/// Cubit responsible for managing application theme state
///
/// Handles theme mode changes and provides the current theme mode
/// to the UI layer through state emissions.
class ThemeCubit extends Cubit<ThemeState> {
  /// Initializes the ThemeCubit with the default theme mode
  ThemeCubit() : super(ThemeReady(defaultThemeMode));

  /// Returns the current theme mode from the state
  ///
  /// Always returns [ThemeMode.light] or [ThemeMode.dark].
  /// If state is [ThemeMode.system], returns the actual system brightness.
  ThemeMode get currentMode {
    final mode = state is ThemeReady
        ? (state as ThemeReady).themeMode
        : defaultThemeMode;
    if (mode == ThemeMode.system) {
      final brightness = PlatformDispatcher.instance.platformBrightness;
      return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }
    return mode;
  }

  /// Sets the theme mode to the specified [mode]
  ///
  /// Emits a new [ThemeReady] state with the updated theme mode.
  ///
  /// Parameters:
  ///   - [mode]: The theme mode to set
  void setThemeMode(ThemeMode mode) {
    emit(ThemeReady(mode));
  }

  /// Toggles between light and dark theme modes
  ///
  /// If current mode is light, switches to dark.
  /// If current mode is dark, switches to light.
  /// System mode defaults to light theme for toggling.
  void toggleTheme() {
    final current = currentMode;
    final newMode = current == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(ThemeReady(newMode));
  }
}
