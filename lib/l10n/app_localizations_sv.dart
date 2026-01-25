// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get containerListPageTitle => 'Behållare i kylen';

  @override
  String get containerDetailNewTitle => 'Ny behållare';

  @override
  String get containerDetailEditTitle => 'Redigera behållare';

  @override
  String get containerDetailNameLabel => 'Behållarens namn';

  @override
  String get containerDetailContainerWeightLabel => 'Behållarens vikt (g)';

  @override
  String get containerDetailTotalWeightLabel => 'Total vikt (g)';

  @override
  String get containerDetailFoodWeightLabel => 'Matens vikt (g)';

  @override
  String get containerDetailPortionLabel => 'Portion';

  @override
  String get containerDetailPortionWeightLabel => 'Portionsvikt (g)';

  @override
  String get containerDetailSaveButton => 'Spara behållare';

  @override
  String containerPortionWeight(String portion) {
    return 'Portion: $portion g';
  }

  @override
  String containerNrPortion(String nrPortion) {
    return 'Antal portioner: $nrPortion';
  }

  @override
  String containerUploadDate(String date) {
    return 'Uppladdningsdatum: $date';
  }

  @override
  String get gen_No_Food => 'Du har ingenting att äta 😢';

  @override
  String gen_Gen_Error(String error) {
    return 'Fel: $error';
  }

  @override
  String get gen_Confirm_Delete_Title => 'Bekräfta borttagning';

  @override
  String gen_Confirm_Delete_Message(String name) {
    return 'Vill du ta bort \"$name\"?';
  }

  @override
  String get gen_Cancel => 'Avbryt';

  @override
  String get gen_Delete => 'Ta bort';

  @override
  String get no_name => 'Utan namn';

  @override
  String get settings_title => 'Inställningar';

  @override
  String get settings_theme => 'Tema';

  @override
  String get settings_help => 'Hjälp';
}
