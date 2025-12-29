import 'package:flutter/material.dart';

/// Widget representing a fridge container item
///
/// Displays the container name, available quantity, available portions,
/// and the date it was added.
class ContenitoreFrigoWidget extends StatelessWidget {
  const ContenitoreFrigoWidget({
    super.key,
    required this.nomeContenitore,
    required this.quantitaDisponibile,
    required this.porzioniDisponibili,
    required this.dataInserimento,
  });

  final String nomeContenitore;
  final int quantitaDisponibile;
  final int porzioniDisponibili;
  final DateTime dataInserimento;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Text(nomeContenitore),
      subtitle: Text(
        'Disponibili: $quantitaDisponibile gr\nPorzioni disponibili: $porzioniDisponibili\nData inserimento: ${dataInserimento.day}/${dataInserimento.month}/${dataInserimento.year}',
      ),
    );
  }
}
