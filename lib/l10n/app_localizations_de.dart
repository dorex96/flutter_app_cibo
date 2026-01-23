// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get containerListPageTitle => 'Behälter im Kühlschrank';

  @override
  String get containerDetailNewTitle => 'Neuer Behälter';

  @override
  String get containerDetailEditTitle => 'Behälter bearbeiten';

  @override
  String get containerDetailNameLabel => 'Behältername';

  @override
  String get containerDetailContainerWeightLabel => 'Behältergewicht (g)';

  @override
  String get containerDetailTotalWeightLabel => 'Gesamtgewicht (g)';

  @override
  String get containerDetailFoodWeightLabel => 'Lebensmittelgewicht (g)';

  @override
  String get containerDetailPortionLabel => 'Portion';

  @override
  String get containerDetailPortionWeightLabel => 'Portionsgewicht (g)';

  @override
  String get containerDetailSaveButton => 'Behälter speichern';

  @override
  String containerPortionWeight(String portion) {
    return 'Portion: $portion g';
  }

  @override
  String containerNrPortion(String nrPortion) {
    return 'Anzahl Portionen: $nrPortion';
  }

  @override
  String containerUploadDate(String date) {
    return 'Uploaddatum: $date';
  }

  @override
  String get gen_No_Food => 'Du hast nichts zu essen 😢';

  @override
  String gen_Gen_Error(String error) {
    return 'Fehler: $error';
  }

  @override
  String get gen_Confirm_Delete_Title => 'Löschung bestätigen';

  @override
  String gen_Confirm_Delete_Message(String name) {
    return 'Möchtest du \"$name\" löschen?';
  }

  @override
  String get gen_Cancel => 'Abbrechen';

  @override
  String get gen_Delete => 'Löschen';

  @override
  String get no_name => 'Ohne Namen';
}
