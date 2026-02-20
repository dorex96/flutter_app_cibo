part of 'elenco_contenitori_screen_bloc.dart';

@immutable
sealed class ElencoContenitoriScreenEvent {}

/// Event to load all saved container sets.
class LoadSetContenitoriEvent extends ElencoContenitoriScreenEvent {}

/// Event to add a new container set.
class AddSetContenitoreEvent extends ElencoContenitoriScreenEvent {
  AddSetContenitoreEvent({
    required this.nome,
    required this.pathImmagine,
    required this.pesoInGrammi,
  });

  final String nome;
  final String pathImmagine;
  final double pesoInGrammi;
}

/// Event to delete a container set by ID.
class DeleteSetContenitoreEvent extends ElencoContenitoriScreenEvent {
  DeleteSetContenitoreEvent({required this.id});
  final int id;
}
