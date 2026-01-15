part of 'dettaglio_contenitore_cubit.dart';

@immutable
sealed class DettaglioContenitoreState {}

final class DettaglioContenitoreInitial extends DettaglioContenitoreState {}

final class DettaglioContenitoreLoading extends DettaglioContenitoreState {}

final class DettaglioContenitoreLoaded extends DettaglioContenitoreState {
  final ContenitoreEntity contenitore;

  DettaglioContenitoreLoaded(this.contenitore);
}

final class DettaglioContenitoreSaved extends DettaglioContenitoreState {}

final class DettaglioContenitoreError extends DettaglioContenitoreState {
  final String message;

  DettaglioContenitoreError(this.message);
}
