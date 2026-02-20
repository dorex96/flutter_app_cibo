import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/app_localizations.dart';
import '../bloc/elenco_contenitori_screen/elenco_contenitori_screen_bloc.dart';
import '../widgets/aggiungi_set_contenitore_bottom_sheet.dart';
import '../widgets/set_contenitore_widget.dart';

/// Screen displaying the list of saved container sets.
///
/// Users can view, add, and delete container set presets.
/// Each preset stores a name, image, and tare weight for reuse
/// when adding food to the fridge.
class ElencoContenitoriScreen extends StatelessWidget {
  const ElencoContenitoriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLoc.containerSetsPageTitle)),
      body:
          BlocBuilder<
            ElencoContenitoriScreenBloc,
            ElencoContenitoriScreenState
          >(builder: _builder),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewSetContenitore(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _builder(BuildContext context, ElencoContenitoriScreenState state) {
    final appLoc = AppLocalizations.of(context)!;

    if (state is ElencoContenitoriScreenLoaded) {
      final items = state.setContenitori;

      if (items.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 64.w,
                color: Theme.of(context).colorScheme.outline,
              ),
              SizedBox(height: 16.h),
              Text(
                appLoc.containerSetsEmpty,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        );
      }

      final theme = Theme.of(context);

      return ListView.builder(
        padding: EdgeInsets.only(top: 8.h, bottom: 88.h),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key('set_dismissible_${item.id}'),
            direction: DismissDirection.horizontal,
            background: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.error,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Icon(
                Icons.delete_outline,
                color: theme.colorScheme.onError,
              ),
            ),
            secondaryBackground: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.error,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Icon(
                Icons.delete_outline,
                color: theme.colorScheme.onError,
              ),
            ),
            confirmDismiss: (direction) => _confirmDelete(context, item.nome),
            onDismissed: (direction) {
              context.read<ElencoContenitoriScreenBloc>().add(
                DeleteSetContenitoreEvent(id: item.id),
              );
            },
            child: SetContenitoreWidget(
              nome: item.nome,
              pesoInGrammi: item.pesoInGrammi,
              pathImmagine: item.pathImmagine,
            ),
          );
        },
      );
    }

    if (state is ElencoContenitoriScreenError) {
      return Center(child: Text(appLoc.gen_Gen_Error(state.message)));
    }

    return const Center(child: CircularProgressIndicator());
  }

  /// Opens the "Add Container Set" modal bottom sheet.
  void _addNewSetContenitore(BuildContext context) {
    final bloc = context.read<ElencoContenitoriScreenBloc>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => AggiungiSetContenitoreBottomSheet(
        onSave: (nome, pathImmagine, pesoInGrammi) {
          bloc.add(
            AddSetContenitoreEvent(
              nome: nome,
              pathImmagine: pathImmagine,
              pesoInGrammi: pesoInGrammi,
            ),
          );
        },
      ),
    );
  }

  /// Shows a confirmation dialog before deleting a container set.
  Future<bool?> _confirmDelete(BuildContext context, String? nome) {
    final appLoc = AppLocalizations.of(context)!;
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(appLoc.gen_Confirm_Delete_Title),
        content: Text(
          appLoc.gen_Confirm_Delete_Message(nome ?? appLoc.no_name),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(appLoc.gen_Cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(appLoc.gen_Delete),
          ),
        ],
      ),
    );
  }
}
