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

  @override
  String get settings_title => 'Paramètres';

  @override
  String get settings_theme => 'Thème';

  @override
  String get settings_help => 'Aide';

  @override
  String get help_title => 'Aide';

  @override
  String get help_intro => 'Voyons comment utiliser au mieux Cibo.';

  @override
  String get help_step1 => 'Commençons par entrer le nom du plat';

  @override
  String get help_step2 =>
      'et immédiatement nous pouvons entrer le poids du conteneur';

  @override
  String get help_step2_note => ', avec le couvercle si applicable.';

  @override
  String get help_step3 =>
      'À ce stade, si nous n\'avons pas encore tout prêt, nous pouvons sauvegarder';

  @override
  String get help_step3_note =>
      'et continuer une fois que nous avons préparé le plat.';

  @override
  String get help_step4 =>
      'Une fois que tout est prêt, remplissons le conteneur et pesons-le, avec le couvercle si applicable, et entrons son poids total';

  @override
  String get help_step5 => 'nous verrons que';

  @override
  String get help_step5_note => 'est calculé automatiquement et en modifiant';

  @override
  String get help_step5_end => 'il sera mis à jour en conséquence.';

  @override
  String get help_step6 =>
      'À ce stade, nous pouvons choisir d\'entrer le nombre de portions';

  @override
  String get help_step6_note => 'ou le poids d\'une seule portion';

  @override
  String get help_step6_end =>
      ', en entrant l\'une, l\'autre se mettra à jour automatiquement.';

  @override
  String get help_step7 =>
      'Nous pouvons maintenant tout sauvegarder avec le bouton enregistrer';

  @override
  String get help_gnam =>
      'Quand nous mangeons, au lieu de modifier les valeurs manuellement, nous pouvons utiliser le bouton Gnam';

  @override
  String get help_gnam_note =>
      'qui supprimera une portion du conteneur et mettra à jour toutes les données.';

  @override
  String get help_thanks => 'Merci d\'avoir téléchargé Cibo.';

  @override
  String get navTabFridge => 'Réfrigérateur';

  @override
  String get navTabContainers => 'Conteneurs';

  @override
  String get navTabSettings => 'Paramètres';

  @override
  String get containerSetsPageTitle => 'Sets de Conteneurs';

  @override
  String get containerSetsEmpty => 'Aucun set de conteneurs enregistré';

  @override
  String get containerSetsAddTitle => 'Ajouter un Set de Conteneur';

  @override
  String get containerSetsNameLabel => 'Nom';

  @override
  String get containerSetsWeightLabel => 'Poids (g)';

  @override
  String get containerSetsImageLabel => 'Image';

  @override
  String get containerSetsSaveButton => 'Enregistrer';

  @override
  String get containerSetsImageCamera => 'Appareil photo';

  @override
  String get containerSetsImageGallery => 'Galerie';

  @override
  String get containerSetsImageChoose => 'Choisir la Source d\'Image';

  @override
  String containerSetsWeight(String weight) {
    return 'Poids : $weight g';
  }

  @override
  String get presetPickerTitle => 'Sélectionner un Conteneur';

  @override
  String get presetPickerEmpty =>
      'Aucun conteneur préenregistré.\nAjoutez-les depuis l\'onglet Conteneurs.';
}
