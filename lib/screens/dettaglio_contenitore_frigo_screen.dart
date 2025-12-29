import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

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
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(appLoc.containerDetailNameLabel),
                  Text(appLoc.containerDetailContainerWeightLabel),
                  Text(appLoc.containerDetailFoodWeightLabel),
                  Text(appLoc.containerDetailPortionLabel),
                  Text(appLoc.containerDetailPortionWeightLabel),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text(appLoc.containerDetailSaveButton),
          ),
        ],
      ),
    );
  }
}
