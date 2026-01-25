import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_sv.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('sv'),
  ];

  /// The title for the container list page
  ///
  /// In it, this message translates to:
  /// **'Contenitori in Frigo'**
  String get containerListPageTitle;

  /// The title for the new container detail page
  ///
  /// In it, this message translates to:
  /// **'Nuovo Contenitore'**
  String get containerDetailNewTitle;

  /// The title for the edit container detail page
  ///
  /// In it, this message translates to:
  /// **'Modifica Contenitore'**
  String get containerDetailEditTitle;

  /// Label for the container name field in the container detail page
  ///
  /// In it, this message translates to:
  /// **'Nome Contenitore'**
  String get containerDetailNameLabel;

  /// Label for the container weight field in the container detail page
  ///
  /// In it, this message translates to:
  /// **'Peso Contenitore (g)'**
  String get containerDetailContainerWeightLabel;

  /// Label for the total weight field (container + food) in the container detail page
  ///
  /// In it, this message translates to:
  /// **'Peso Totale (g)'**
  String get containerDetailTotalWeightLabel;

  /// Label for the food weight field in the container detail page
  ///
  /// In it, this message translates to:
  /// **'Peso Cibo (g)'**
  String get containerDetailFoodWeightLabel;

  /// Label for the portion field in the container detail page
  ///
  /// In it, this message translates to:
  /// **'Porzione'**
  String get containerDetailPortionLabel;

  /// Label for the portion weight field in the container detail page
  ///
  /// In it, this message translates to:
  /// **'Peso Porzione (g)'**
  String get containerDetailPortionWeightLabel;

  /// Label for the save container button in the container detail page
  ///
  /// In it, this message translates to:
  /// **'Salva Contenitore'**
  String get containerDetailSaveButton;

  /// Label showing the portion weight
  ///
  /// In it, this message translates to:
  /// **'Porzione: {portion} g'**
  String containerPortionWeight(String portion);

  /// Label showing the number of portions
  ///
  /// In it, this message translates to:
  /// **'N. Porzioni: {nrPortion}'**
  String containerNrPortion(String nrPortion);

  /// Label showing the upload date of the container
  ///
  /// In it, this message translates to:
  /// **'Data Caricamento: {date}'**
  String containerUploadDate(String date);

  /// Message displayed when there is no food in the fridge
  ///
  /// In it, this message translates to:
  /// **'Non hai nulla da mangiare 😢'**
  String get gen_No_Food;

  /// Generic error message with error details
  ///
  /// In it, this message translates to:
  /// **'Errore: {error}'**
  String gen_Gen_Error(String error);

  /// Title for the delete confirmation dialog
  ///
  /// In it, this message translates to:
  /// **'Conferma Eliminazione'**
  String get gen_Confirm_Delete_Title;

  /// Message for the delete confirmation dialog
  ///
  /// In it, this message translates to:
  /// **'Vuoi eliminare \"{name}\"?'**
  String gen_Confirm_Delete_Message(String name);

  /// Cancel button label
  ///
  /// In it, this message translates to:
  /// **'Annulla'**
  String get gen_Cancel;

  /// Delete button label
  ///
  /// In it, this message translates to:
  /// **'Elimina'**
  String get gen_Delete;

  /// Placeholder for items without a name
  ///
  /// In it, this message translates to:
  /// **'Senza Nome'**
  String get no_name;

  /// Title for the settings screen
  ///
  /// In it, this message translates to:
  /// **'Impostazioni'**
  String get settings_title;

  /// Label for the theme setting in the settings screen
  ///
  /// In it, this message translates to:
  /// **'Tema'**
  String get settings_theme;

  /// Label for the help option in the settings screen
  ///
  /// In it, this message translates to:
  /// **'Aiuto'**
  String get settings_help;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'sv',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'sv':
      return AppLocalizationsSv();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
