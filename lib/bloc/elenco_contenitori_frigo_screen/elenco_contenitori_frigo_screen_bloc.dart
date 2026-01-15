import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/entities/contenitore_entity.dart';
import '../../repositories/contenitori_repository.dart';

part 'elenco_contenitori_frigo_screen_event.dart';
part 'elenco_contenitori_frigo_screen_state.dart';

class ElencoContenitoriFrigoScreenBloc
    extends
        Bloc<
          ElencoContenitoriFrigoScreenEvent,
          ElencoContenitoriFrigoScreenState
        > {
  final _contenitoriRepository = ContenitoriRepository();

  ElencoContenitoriFrigoScreenBloc()
    : super(ElencoContenitoriFrigoScreenInitial()) {
    on<LoadContenitoriEvent>(_loadContenitori);
    on<AddContenitoreEvent>(_addContenitore);
    on<EditContenitoreEvent>(_editContenitore);
    on<DeleteContenitoreEvent>(_deleteContenitore);

    add(LoadContenitoriEvent());
  }

  /// Loads the list of "contenitori" from the repository and updates the state accordingly.
  Future<void> _loadContenitori(
    LoadContenitoriEvent event,
    Emitter<ElencoContenitoriFrigoScreenState> emit,
  ) async {
    try {
      emit(ElencoContenitoriFrigoScreenLoading());

      final contenitori = _contenitoriRepository.getAllSorted();

      emit(ElencoContenitoriFrigoScreenLoaded(contenitori));
    } catch (e) {
      emit(ElencoContenitoriFrigoScreenError(e.toString()));
    }
  }

  Future<void> _addContenitore(
    AddContenitoreEvent event,
    Emitter<ElencoContenitoriFrigoScreenState> emit,
  ) async {
    try {
      final newId = _contenitoriRepository.add(ContenitoreEntity());
      emit(ElencoContenitoriFrigoScreenEdit(id: newId, isNew: true));
    } catch (e) {
      emit(ElencoContenitoriFrigoScreenError(e.toString()));
    }
  }

  Future<void> _editContenitore(
    EditContenitoreEvent event,
    Emitter<ElencoContenitoriFrigoScreenState> emit,
  ) async {
    try {
      emit(ElencoContenitoriFrigoScreenEdit(id: event.id, isNew: false));
    } catch (e) {
      emit(ElencoContenitoriFrigoScreenError(e.toString()));
    }
  }

  Future<void> _deleteContenitore(
    DeleteContenitoreEvent event,
    Emitter<ElencoContenitoriFrigoScreenState> emit,
  ) async {
    try {
      _contenitoriRepository.delete(event.id);
      add(LoadContenitoriEvent());
    } catch (e) {
      emit(ElencoContenitoriFrigoScreenError(e.toString()));
    }
  }
}
