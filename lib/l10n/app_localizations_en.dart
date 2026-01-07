// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get containerListPageTitle => 'Containers in Fridge';

  @override
  String get containerDetailNewTitle => 'New Container';

  @override
  String get conteinerDetailEditTitle => 'Edit Container';

  @override
  String get containerDetailNameLabel => 'Container Name';

  @override
  String get containerDetailContainerWeightLabel => 'Container Weight (g)';

  @override
  String get containerDetailFoodWeightLabel => 'Food Weight (g)';

  @override
  String get containerDetailPortionLabel => 'Portion';

  @override
  String get containerDetailPortionWeightLabel => 'Portion Weight (g)';

  @override
  String get containerDetailSaveButton => 'Save Container';

  @override
  String get gen_No_Food => 'You have nothing to eat 😢';

  @override
  String gen_Gen_Error(String error) {
    return 'Error: $error';
  }
}
