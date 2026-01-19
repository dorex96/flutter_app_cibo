import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

/// Widget representing a fridge container item
///
/// Displays the container name, available quantity, available portions,
/// and the date it was added.
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
    return ListTile(
      isThreeLine: true,
      title: Text(nomeContenitore),
      subtitle: Text(
        '${localizations.containerPortionWeight(pesoPorzione.toStringAsFixed(2))}\n'
        '${localizations.containerNrPortion(porzioniDisponibili.toString())}\n'
        '${localizations.containerUploadDate('${dataInserimento.day}/${dataInserimento.month}/${dataInserimento.year}')}',
      ),
      trailing: IconButton(onPressed: gman, icon: const Icon(Icons.food_bank)),
    );
  }
}
