// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get containerListPageTitle => 'Contenedores en el Frigorífico';

  @override
  String get containerDetailNewTitle => 'Nuevo Contenedor';

  @override
  String get containerDetailEditTitle => 'Editar Contenedor';

  @override
  String get containerDetailNameLabel => 'Nombre del Contenedor';

  @override
  String get containerDetailContainerWeightLabel => 'Peso del Contenedor (g)';

  @override
  String get containerDetailTotalWeightLabel => 'Peso Total (g)';

  @override
  String get containerDetailFoodWeightLabel => 'Peso del Alimento (g)';

  @override
  String get containerDetailPortionLabel => 'Porción';

  @override
  String get containerDetailPortionWeightLabel => 'Peso de la Porción (g)';

  @override
  String get containerDetailSaveButton => 'Guardar Contenedor';

  @override
  String containerPortionWeight(String portion) {
    return 'Porción: $portion g';
  }

  @override
  String containerNrPortion(String nrPortion) {
    return 'N. Porciones: $nrPortion';
  }

  @override
  String containerUploadDate(String date) {
    return 'Fecha de Carga: $date';
  }

  @override
  String get gen_No_Food => 'No tienes nada que comer 😢';

  @override
  String gen_Gen_Error(String error) {
    return 'Error: $error';
  }

  @override
  String get gen_Confirm_Delete_Title => 'Confirmar Eliminación';

  @override
  String gen_Confirm_Delete_Message(String name) {
    return '¿Quieres eliminar \"$name\"?';
  }

  @override
  String get gen_Cancel => 'Cancelar';

  @override
  String get gen_Delete => 'Eliminar';

  @override
  String get no_name => 'Sin Nombre';

  @override
  String get settings_title => 'Configuración';

  @override
  String get settings_theme => 'Tema';

  @override
  String get settings_help => 'Ayuda';

  @override
  String get help_title => 'Ayuda';

  @override
  String get help_intro => 'Veamos cómo utilizar Cibo de la mejor manera.';

  @override
  String get help_step1 => 'Empezamos introduciendo el nombre del plato';

  @override
  String get help_step2 =>
      'e inmediatamente podemos introducir el peso del contenedor';

  @override
  String get help_step2_note => ', con la tapa si corresponde.';

  @override
  String get help_step3 =>
      'En este punto, si aún no tenemos todo listo, podemos guardar';

  @override
  String get help_step3_note =>
      'y continuar una vez que hayamos preparado el plato.';

  @override
  String get help_step4 =>
      'Una vez que todo esté listo, llenamos el contenedor y lo pesamos, con la tapa si corresponde, e introducimos su peso total';

  @override
  String get help_step5 => 'veremos que';

  @override
  String get help_step5_note => 'se calcula automáticamente y al cambiar';

  @override
  String get help_step5_end => 'se actualizará en consecuencia.';

  @override
  String get help_step6 =>
      'En este punto podemos elegir introducir el número de porciones';

  @override
  String get help_step6_note => 'o el peso de una sola porción';

  @override
  String get help_step6_end =>
      ', al introducir una, la otra se actualizará automáticamente.';

  @override
  String get help_step7 => 'Ahora podemos guardar todo usando el botón guardar';

  @override
  String get help_gnam =>
      'Cuando comemos, en lugar de cambiar los valores manualmente podemos usar el botón Gnam';

  @override
  String get help_gnam_note =>
      'que eliminará una porción del contenedor y actualizará todos los datos.';

  @override
  String get help_thanks => 'Gracias por descargar Cibo.';
}
