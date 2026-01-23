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
}
