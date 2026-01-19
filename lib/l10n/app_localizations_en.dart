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
  String get containerDetailEditTitle => 'Edit Container';

  @override
  String get containerDetailNameLabel => 'Container Name';

  @override
  String get containerDetailContainerWeightLabel => 'Container Weight (g)';

  @override
  String get containerDetailTotalWeightLabel => 'Total Weight (g)';

  @override
  String get containerDetailFoodWeightLabel => 'Food Weight (g)';

  @override
  String get containerDetailPortionLabel => 'Portion';

  @override
  String get containerDetailPortionWeightLabel => 'Portion Weight (g)';

  @override
  String get containerDetailSaveButton => 'Save Container';

  @override
  String containerPortionWeight(String portion) {
    return 'Portion: $portion g';
  }

  @override
  String containerNrPortion(String nrPortion) {
    return 'N. Portions: $nrPortion';
  }

  @override
  String containerUploadDate(String date) {
    return 'Upload Date: $date';
  }

  @override
  String get gen_No_Food => 'You have nothing to eat 😢';

  @override
  String gen_Gen_Error(String error) {
    return 'Error: $error';
  }

  @override
  String get gen_Confirm_Delete_Title => 'Confirm Deletion';

  @override
  String gen_Confirm_Delete_Message(String name) {
    return 'Do you want to delete \"$name\"?';
  }

  @override
  String get gen_Cancel => 'Cancel';

  @override
  String get gen_Delete => 'Delete';
}
