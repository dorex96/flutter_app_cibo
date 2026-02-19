import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              children: [
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.palette_outlined,
                          color: theme.colorScheme.primary,
                        ),
                        title: Text(localizations.settings_theme),
                        onTap: () => _toggleTheme(context),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              currentThemeMode.name,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.chevron_right,
                              size: 24.w,
                              color: theme.colorScheme.outline,
                            ),
                          ],
                        ),
                      ),
                      Divider(indent: 56.w),
                      ListTile(
                        leading: Icon(
                          Icons.help_outline,
                          color: theme.colorScheme.primary,
                        ),
                        title: Text(localizations.settings_help),
                        onTap: () => _handleHelp(context),
                        trailing: Icon(
                          Icons.chevron_right,
                          size: 24.w,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.h),
            child: Center(
              child: Text(
                'Copyright © 2026 Dorin Tverdohleb',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
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

  _handleHelp(BuildContext context) {
    context.push('/impostazioni/aiuto');
  }
}
