/// Main entry point for the Flutter application
library;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_router.dart';
import 'config/app_theme.dart';
import 'constants/app_constants.dart';
import 'cubit/theme_cubit/theme_cubit.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

/// Root widget of the application
///
/// Initializes screen utilities, sets up BLoC providers, and configures
/// localization and theme support.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: appDesignSize,
      builder: (context, child) => BlocProvider(
        create: (_) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (_, state) => switch (state) {
            ThemeReady(:final mode) => MaterialApp.router(
              routerConfig: appRouter,
              themeMode: mode,
              theme: lightTheme,
              darkTheme: darkTheme,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: supportedLocales,
            ),
            _ => const SizedBox(),
          },
        ),
      ),
    );
  }
}
