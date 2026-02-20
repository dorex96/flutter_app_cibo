import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/dettaglio_contenitore_cubit/dettaglio_contenitore_cubit.dart';
import '../l10n/app_localizations.dart';
import '../widgets/input_dettaglio_contenitore_widget.dart';
import '../widgets/seleziona_set_contenitore_bottom_sheet.dart';

/// A screen that displays the details of a refrigerator container.
///
/// The [idContenitore] parameter specifies the unique identifier of the container.
class DettaglioContenitoreFrigoScreen extends StatelessWidget {
  const DettaglioContenitoreFrigoScreen({
    super.key,
    required this.idContenitore,
    this.isNew = false,
  });

  final int idContenitore;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) =>
          DettaglioContenitoreCubit(contenitoreId: idContenitore),
      child: BlocConsumer<DettaglioContenitoreCubit, DettaglioContenitoreState>(
        listener: (context, state) {
          if (state is DettaglioContenitoreSaved) {
            Navigator.of(context).pop();
          } else if (state is DettaglioContenitoreError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is DettaglioContenitoreLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final cubit = context.read<DettaglioContenitoreCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(
                isNew
                    ? appLoc.containerDetailNewTitle
                    : appLoc.containerDetailEditTitle,
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 24.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputDettaglioContenitoreWidget(
                            key: Key('name_$idContenitore'),
                            label: appLoc.containerDetailNameLabel,
                            controller: cubit.nameController,
                          ),
                          InputDettaglioContenitoreWidget(
                            key: Key('contweight_$idContenitore'),
                            label: appLoc.containerDetailContainerWeightLabel,
                            controller: cubit.containerWeightController,
                            keyboardType: TextInputType.number,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.inventory_2_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              tooltip: appLoc.presetPickerTitle,
                              onPressed: () =>
                                  _openPresetPicker(context, cubit),
                            ),
                          ),
                          InputDettaglioContenitoreWidget(
                            key: Key('totalweight_$idContenitore'),
                            label: appLoc.containerDetailTotalWeightLabel,
                            controller: cubit.totalWeightController,
                            keyboardType: TextInputType.number,
                          ),
                          InputDettaglioContenitoreWidget(
                            key: Key('foodweight_$idContenitore'),
                            label: appLoc.containerDetailFoodWeightLabel,
                            controller: cubit.foodWeightController,
                            keyboardType: TextInputType.number,
                          ),
                          InputDettaglioContenitoreWidget(
                            key: Key('portion_$idContenitore'),
                            label: appLoc.containerDetailPortionLabel,
                            controller: cubit.portionController,
                            keyboardType: TextInputType.number,
                          ),
                          InputDettaglioContenitoreWidget(
                            key: Key('portionweight_$idContenitore'),
                            label: appLoc.containerDetailPortionWeightLabel,
                            controller: cubit.portionWeightController,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24.h,
                  ),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () => cubit.saveContenitore(),
                      child: Text(appLoc.containerDetailSaveButton),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Opens a bottom sheet to pick a saved container preset.
  ///
  /// When a preset is selected, the container weight field is populated
  /// with the preset's tare weight.
  void _openPresetPicker(
    BuildContext context,
    DettaglioContenitoreCubit cubit,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SelezionaSetContenitoreBottomSheet(
        onSelected: (preset) {
          cubit.containerWeightController.text =
              preset.pesoInGrammi == preset.pesoInGrammi.roundToDouble()
              ? preset.pesoInGrammi.round().toString()
              : preset.pesoInGrammi.toStringAsFixed(2);
        },
      ),
    );
  }
}
