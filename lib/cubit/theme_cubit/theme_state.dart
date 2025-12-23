part of 'theme_cubit.dart';

/// Base class for all theme-related states
@immutable
sealed class ThemeState {}

/// Initial state of the theme (currently unused but kept for future use)
final class ThemeInitial extends ThemeState {}

/// State emitted when theme is ready and loaded
///
/// Contains the current [ThemeMode] to be applied to the application.
final class ThemeReady extends ThemeState {
  /// The current theme mode
  final ThemeMode mode;

  /// Creates a new [ThemeReady] state with the specified [mode]
  ThemeReady(this.mode);
}
