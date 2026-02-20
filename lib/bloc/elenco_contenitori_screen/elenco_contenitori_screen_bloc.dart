import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/entities/set_contenitori_entity.dart';
import '../../repositories/set_contenitori_repository.dart';

part 'elenco_contenitori_screen_event.dart';
part 'elenco_contenitori_screen_state.dart';

/// BLoC for managing the container sets list screen.
///
/// Handles loading, adding, and deleting container set presets.
class ElencoContenitoriScreenBloc
    extends Bloc<ElencoContenitoriScreenEvent, ElencoContenitoriScreenState> {
  final _repository = SetContenitoriRepository();

  ElencoContenitoriScreenBloc() : super(ElencoContenitoriScreenInitial()) {
    on<LoadSetContenitoriEvent>(_loadSetContenitori);
    on<AddSetContenitoreEvent>(_addSetContenitore);
    on<DeleteSetContenitoreEvent>(_deleteSetContenitore);

    add(LoadSetContenitoriEvent());
  }

  Future<void> _loadSetContenitori(
    LoadSetContenitoriEvent event,
    Emitter<ElencoContenitoriScreenState> emit,
  ) async {
    try {
      emit(ElencoContenitoriScreenLoading());
      final items = _repository.getAll();
      emit(ElencoContenitoriScreenLoaded(items));
    } catch (e) {
      emit(ElencoContenitoriScreenError(e.toString()));
    }
  }

  Future<void> _addSetContenitore(
    AddSetContenitoreEvent event,
    Emitter<ElencoContenitoriScreenState> emit,
  ) async {
    try {
      final entity = SetContenitoriEntity(
        nome: event.nome,
        pathImmagine: event.pathImmagine,
        pesoInGrammi: event.pesoInGrammi,
      );
      _repository.add(entity);
      add(LoadSetContenitoriEvent());
    } catch (e) {
      emit(ElencoContenitoriScreenError(e.toString()));
    }
  }

  Future<void> _deleteSetContenitore(
    DeleteSetContenitoreEvent event,
    Emitter<ElencoContenitoriScreenState> emit,
  ) async {
    try {
      _repository.delete(event.id);
      add(LoadSetContenitoriEvent());
    } catch (e) {
      emit(ElencoContenitoriScreenError(e.toString()));
    }
  }
}
