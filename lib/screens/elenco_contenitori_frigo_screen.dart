import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';

import '../widgets/contenitore_frigo_widget.dart';

/// Screen that displays the list of containers in the fridge
///
/// Uses localized strings for the title and includes a floating action button
/// to add new containers.
class ElencoContenitoriFrigoScreen extends StatelessWidget {
  const ElencoContenitoriFrigoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLoc.containerListPageTitle)),
      body: ListView.builder(
        itemCount: 20, // Example item count
        itemBuilder: (context, index) => ContenitoreFrigoWidget(
          dataInserimento: DateTime.now(),
          nomeContenitore: 'Contenitore ${index + 1}',
          porzioniDisponibili: 2 + index,
          quantitaDisponibile: 100 + (index * 10),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewContainer(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  _addNewContainer(BuildContext context) async {
    await context.push('/dettaglio-contenitore-frigo/-1');
  }
}
