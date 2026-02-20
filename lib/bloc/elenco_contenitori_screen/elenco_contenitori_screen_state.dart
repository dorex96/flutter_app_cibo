part of 'elenco_contenitori_screen_bloc.dart';

@immutable
sealed class ElencoContenitoriScreenState {}

final class ElencoContenitoriScreenInitial
    extends ElencoContenitoriScreenState {}

final class ElencoContenitoriScreenLoading
    extends ElencoContenitoriScreenState {}

final class ElencoContenitoriScreenLoaded extends ElencoContenitoriScreenState {
  final List<SetContenitoriEntity> setContenitori;
  ElencoContenitoriScreenLoaded(this.setContenitori);
}

final class ElencoContenitoriScreenError extends ElencoContenitoriScreenState {
  final String message;
  ElencoContenitoriScreenError(this.message);
}
