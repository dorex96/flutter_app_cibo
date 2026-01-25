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

  @override
  String get no_name => 'No Name';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_theme => 'Theme';

  @override
  String get settings_help => 'Help';

  @override
  String get help_title => 'Help';

  @override
  String get help_intro => 'Let\'s see how to make the best use of Cibo.';

  @override
  String get help_step1 => 'Start by entering the name of the dish';

  @override
  String get help_step2 =>
      'and immediately we can enter the weight of the container';

  @override
  String get help_step2_note => ', with the lid if applicable.';

  @override
  String get help_step3 =>
      'At this point, if we don\'t have everything ready yet, we can save';

  @override
  String get help_step3_note => 'and continue once we have prepared the dish.';

  @override
  String get help_step4 =>
      'Once everything is ready, fill the container and weigh it, with the lid if applicable, and enter its total weight';

  @override
  String get help_step5 => 'we will see that';

  @override
  String get help_step5_note => 'is calculated automatically and by changing';

  @override
  String get help_step5_end => 'it will update accordingly.';

  @override
  String get help_step6 =>
      'At this point we can choose to enter the number of portions';

  @override
  String get help_step6_note => 'or the weight of a single portion';

  @override
  String get help_step6_end =>
      ', entering one will automatically update the other.';

  @override
  String get help_step7 => 'We can now save everything using the save button';

  @override
  String get help_gnam =>
      'When we eat our meal, instead of manually changing the values we can use the Gnam button';

  @override
  String get help_gnam_note =>
      'which will remove one portion from the container and update all the data.';

  @override
  String get help_thanks => 'Thank you for downloading Cibo.';
}
