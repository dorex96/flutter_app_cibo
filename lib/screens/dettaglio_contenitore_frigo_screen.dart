import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/app_localizations.dart';
import '../widgets/input_dettaglio_contenitore_widget.dart';

/// A screen that displays the details of a refrigerator container.
///
/// The [idContenitore] parameter specifies the unique identifier of the container.
class DettaglioContenitoreFrigoScreen extends StatelessWidget {
  const DettaglioContenitoreFrigoScreen({
    super.key,
    required this.idContenitore,
  });

  final int idContenitore;

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(appLoc.containerDetailNewTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputDettaglioContenitoreWidget(
                      label: appLoc.containerDetailNameLabel,
                    ),
                    InputDettaglioContenitoreWidget(
                      label: appLoc.containerDetailContainerWeightLabel,
                    ),
                    InputDettaglioContenitoreWidget(
                      label: appLoc.containerDetailFoodWeightLabel,
                    ),
                    InputDettaglioContenitoreWidget(
                      label: appLoc.containerDetailPortionLabel,
                    ),
                    InputDettaglioContenitoreWidget(
                      label: appLoc.containerDetailPortionWeightLabel,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: null,
                child: Text(appLoc.containerDetailSaveButton),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
