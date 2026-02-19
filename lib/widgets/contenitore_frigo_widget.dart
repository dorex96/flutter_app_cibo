import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/app_localizations.dart';

/// Widget representing a fridge container item
///
/// Displays the container name, available quantity, available portions,
/// and the date it was added using a modern card-based layout.
class ContenitoreFrigoWidget extends StatelessWidget {
  const ContenitoreFrigoWidget({
    super.key,
    required this.nomeContenitore,
    required this.pesoPorzione,
    required this.porzioniDisponibili,
    required this.dataInserimento,
    this.gman,
  });

  final String nomeContenitore;
  final double pesoPorzione;
  final int porzioniDisponibili;
  final DateTime dataInserimento;
  final Function()? gman;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.kitchen,
                color: colorScheme.onPrimaryContainer,
                size: 24.w,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nomeContenitore,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    localizations.containerPortionWeight(
                      pesoPorzione.toStringAsFixed(2),
                    ),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text(
                        localizations.containerNrPortion(
                          porzioniDisponibili.toString(),
                        ),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        localizations.containerUploadDate(
                          '${dataInserimento.day}/${dataInserimento.month}/${dataInserimento.year}',
                        ),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: gman,
              icon: Icon(
                Icons.restaurant,
                color: colorScheme.secondary,
              ),
              tooltip: 'Gnam!',
              style: IconButton.styleFrom(
                backgroundColor:
                    colorScheme.secondaryContainer.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
