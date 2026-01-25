import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/app_localizations.dart';
import '../cubit/theme_cubit/theme_cubit.dart';

/// A placeholder screen for settings (impostazioni).
/// This screen can be expanded with actual settings options as needed.
class ImpostazioniScreen extends StatelessWidget {
  const ImpostazioniScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final currentThemeMode = context.watch<ThemeCubit>().currentMode;
    return Scaffold(
      appBar: AppBar(title: Text(localizations.settings_title)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Button to toggle theme
                ListTile(
                  leading: const Icon(Icons.color_lens),
                  title: Text(localizations.settings_theme),
                  onTap: () => _toggleTheme(context),
                  trailing: SizedBox(
                    width: 80.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(currentThemeMode.name),
                        SizedBox(width: 10.w),
                        Icon(Icons.chevron_right, size: 24.w),
                      ],
                    ),
                  ),
                ),

                // Button to open Help
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: Text(localizations.settings_help),
                  onTap: () {
                    // Implement help action
                  },
                  trailing: Icon(Icons.chevron_right, size: 24.w),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
            child: Center(
              child: Text(
                'Copyright © 2026 Dorin Tverdohleb',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _toggleTheme(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    themeCubit.toggleTheme();
  }
}
