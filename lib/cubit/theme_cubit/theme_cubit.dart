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
  /// Returns [ThemeMode.system] if state is not [ThemeReady]
  ThemeMode get currentMode =>
      state is ThemeReady ? (state as ThemeReady).mode : defaultThemeMode;

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
