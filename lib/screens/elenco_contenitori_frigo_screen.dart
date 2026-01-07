import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';

import '../widgets/contenitore_frigo_widget.dart';
import '../bloc/elenco_contenitori_frigo_screen/elenco_contenitori_frigo_screen_bloc.dart';

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
      body:
          BlocConsumer<
            ElencoContenitoriFrigoScreenBloc,
            ElencoContenitoriFrigoScreenState
          >(listener: _listener, builder: _builder),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewContenitore(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  _listener(
    BuildContext context,
    ElencoContenitoriFrigoScreenState state,
  ) async {
    if (state is ElencoContenitoriFrigoScreenEdit) {
      await context.push('/dettaglio-contenitore-frigo/${state.id}');
      if (context.mounted) {
        context.read<ElencoContenitoriFrigoScreenBloc>().add(
          LoadContenitoriEvent(),
        );
      }
    }
  }

  Widget _builder(
    BuildContext context,
    ElencoContenitoriFrigoScreenState state,
  ) {
    final appLoc = AppLocalizations.of(context)!;

    if (state is ElencoContenitoriFrigoScreenLoaded) {
      final contenitori = state.contenitori;

      if (contenitori.isEmpty) {
        return Center(child: Text(appLoc.gen_No_Food));
      }

      return ListView.builder(
        itemCount: contenitori.length,
        itemBuilder: (context, index) {
          final contenitore = contenitori[index];
          return InkWell(
            onTap: () => _editContenitore(context, contenitore.id),
            child: ContenitoreFrigoWidget(
              dataInserimento: contenitore.dataCaricamento ?? DateTime.now(),
              nomeContenitore: contenitore.nome ?? 'Senza nome',
              porzioniDisponibili: contenitore.porzioni ?? 0,
              quantitaDisponibile: contenitore.pesoCibo ?? 0,
            ),
          );
        },
      );
    }

    if (state is ElencoContenitoriFrigoScreenError) {
      return Center(child: Text(appLoc.gen_Gen_Error(state.message)));
    }

    return Center(child: CircularProgressIndicator());
  }

  _addNewContenitore(BuildContext context) async {
    context.read<ElencoContenitoriFrigoScreenBloc>().add(AddContenitoreEvent());
  }

  _editContenitore(BuildContext context, int id) async {
    context.read<ElencoContenitoriFrigoScreenBloc>().add(
      EditContenitoreEvent(id: id),
    );
  }
}
