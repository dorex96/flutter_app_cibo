part of 'elenco_contenitori_frigo_screen_bloc.dart';

@immutable
sealed class ElencoContenitoriFrigoScreenState {}

final class ElencoContenitoriFrigoScreenInitial
    extends ElencoContenitoriFrigoScreenState {}

final class ElencoContenitoriFrigoScreenLoading
    extends ElencoContenitoriFrigoScreenState {}

final class ElencoContenitoriFrigoScreenLoaded
    extends ElencoContenitoriFrigoScreenState {
  final List<ContenitoreEntity> contenitori;
  ElencoContenitoriFrigoScreenLoaded(this.contenitori);
}

final class ElencoContenitoriFrigoScreenError
    extends ElencoContenitoriFrigoScreenState {
  final String message;
  ElencoContenitoriFrigoScreenError(this.message);
}

final class ElencoContenitoriFrigoScreenEdit
    extends ElencoContenitoriFrigoScreenState {
  final int id;
  ElencoContenitoriFrigoScreenEdit(this.id);
}
