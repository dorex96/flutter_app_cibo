part of 'elenco_contenitori_frigo_screen_bloc.dart';

@immutable
sealed class ElencoContenitoriFrigoScreenEvent {}

class LoadContenitoriEvent extends ElencoContenitoriFrigoScreenEvent {}

class AddContenitoreEvent extends ElencoContenitoriFrigoScreenEvent {}

class EditContenitoreEvent extends ElencoContenitoriFrigoScreenEvent {
  EditContenitoreEvent({required this.id});

  final int id;
}

class DeleteContenitoreEvent extends ElencoContenitoriFrigoScreenEvent {
  DeleteContenitoreEvent({required this.id});

  final int id;
}
