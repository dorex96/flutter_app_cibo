// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get containerListPageTitle => 'Contenitori in Frigo';

  @override
  String get containerDetailNewTitle => 'Nuovo Contenitore';

  @override
  String get conteinerDetailEditTitle => 'Modifica Contenitore';

  @override
  String get containerDetailNameLabel => 'Nome Contenitore';

  @override
  String get containerDetailContainerWeightLabel => 'Peso Contenitore (g)';

  @override
  String get containerDetailFoodWeightLabel => 'Peso Cibo (g)';

  @override
  String get containerDetailPortionLabel => 'Porzione';

  @override
  String get containerDetailPortionWeightLabel => 'Peso Porzione (g)';

  @override
  String get containerDetailSaveButton => 'Salva Contenitore';
}
