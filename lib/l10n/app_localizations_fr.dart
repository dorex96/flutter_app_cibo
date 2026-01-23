// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get containerListPageTitle => 'Conteneurs dans le Réfrigérateur';

  @override
  String get containerDetailNewTitle => 'Nouveau Conteneur';

  @override
  String get containerDetailEditTitle => 'Modifier Conteneur';

  @override
  String get containerDetailNameLabel => 'Nom du Conteneur';

  @override
  String get containerDetailContainerWeightLabel => 'Poids du Conteneur (g)';

  @override
  String get containerDetailTotalWeightLabel => 'Poids Total (g)';

  @override
  String get containerDetailFoodWeightLabel => 'Poids de l\'Aliment (g)';

  @override
  String get containerDetailPortionLabel => 'Portion';

  @override
  String get containerDetailPortionWeightLabel => 'Poids de la Portion (g)';

  @override
  String get containerDetailSaveButton => 'Enregistrer Conteneur';

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
    return 'Date de Téléchargement: $date';
  }

  @override
  String get gen_No_Food => 'Tu n\'as rien à manger 😢';

  @override
  String gen_Gen_Error(String error) {
    return 'Erreur: $error';
  }

  @override
  String get gen_Confirm_Delete_Title => 'Confirmer la Suppression';

  @override
  String gen_Confirm_Delete_Message(String name) {
    return 'Voulez-vous supprimer \"$name\"?';
  }

  @override
  String get gen_Cancel => 'Annuler';

  @override
  String get gen_Delete => 'Supprimer';

  @override
  String get no_name => 'Sans Nom';
}
