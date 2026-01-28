/// Main entry point for the Flutter application
library;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_router.dart';
import 'constants/app_constants.dart';
import 'theme/theme.dart';
import 'cubit/theme_cubit/theme_cubit.dart';
import 'l10n/app_localizations.dart';
import 'services/objectbox.dart';

/// Global instance of ObjectBox for database operations
late ObjectBox objectBox;

/// Global instance of ThemeCubit
late ThemeCubit themeCubit;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectBox = await ObjectBox.create();
  themeCubit = await ThemeCubit.create();

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
      builder: (context, child) => BlocProvider.value(
        value: themeCubit,
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (_, state) => switch (state) {
            ThemeReady(themeMode: final themeMode) => MaterialApp.router(
              routerConfig: appRouter,
              themeMode: themeMode,
              theme: lightTheme,
              darkTheme: darkTheme,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
            ),
            _ => const SizedBox(),
          },
        ),
      ),
    );
  }
}
