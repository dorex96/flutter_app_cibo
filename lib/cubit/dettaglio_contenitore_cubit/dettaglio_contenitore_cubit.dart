import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/entities/contenitore_entity.dart';
import '../../repositories/contenitori_repository.dart';

part 'dettaglio_contenitore_state.dart';

class DettaglioContenitoreCubit extends Cubit<DettaglioContenitoreState> {
  final ContenitoriRepository _repository;
  final int contenitoreId;

  // Controller gestiti dal Cubit
  late final TextEditingController nameController;
  late final TextEditingController containerWeightController;
  late final TextEditingController foodWeightController;
  late final TextEditingController portionController;
  late final TextEditingController portionWeightController;

  DettaglioContenitoreCubit({
    required this.contenitoreId,
    ContenitoriRepository? repository,
  }) : _repository = repository ?? ContenitoriRepository(),
       super(DettaglioContenitoreInitial()) {
    _initControllers();
    _loadContenitore();
  }

  void _initControllers() {
    nameController = TextEditingController();
    containerWeightController = TextEditingController();
    foodWeightController = TextEditingController();
    portionController = TextEditingController();
    portionWeightController = TextEditingController();
  }

  Future<void> _loadContenitore() async {
    try {
      emit(DettaglioContenitoreLoading());

      final contenitore = _repository.get(contenitoreId);

      if (contenitore != null) {
        // Popola i controller con i dati esistenti
        nameController.text = contenitore.nome ?? '';
        containerWeightController.text =
            contenitore.pesoContenitore?.toString() ?? '';
        foodWeightController.text = contenitore.pesoCibo?.toString() ?? '';
        portionController.text = contenitore.porzioni?.toString() ?? '';
        portionWeightController.text =
            contenitore.pesoPorzione?.toString() ?? '';

        emit(DettaglioContenitoreLoaded(contenitore));
      } else {
        emit(DettaglioContenitoreError('Contenitore non trovato'));
      }
    } catch (e) {
      emit(DettaglioContenitoreError(e.toString()));
    }
  }

  Future<void> saveContenitore() async {
    try {
      final contenitore = ContenitoreEntity()
        ..id = contenitoreId
        ..nome = nameController.text.isEmpty ? null : nameController.text
        ..pesoContenitore = containerWeightController.text.isEmpty
            ? null
            : double.tryParse(containerWeightController.text)
        ..pesoCibo = foodWeightController.text.isEmpty
            ? null
            : double.tryParse(foodWeightController.text)
        ..porzioni = portionController.text.isEmpty
            ? null
            : int.tryParse(portionController.text)
        ..pesoPorzione = portionWeightController.text.isEmpty
            ? null
            : double.tryParse(portionWeightController.text)
        ..dataCaricamento = DateTime.now();

      _repository.put(contenitore);
      emit(DettaglioContenitoreSaved());
    } catch (e) {
      emit(DettaglioContenitoreError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    containerWeightController.dispose();
    foodWeightController.dispose();
    portionController.dispose();
    portionWeightController.dispose();
    return super.close();
  }
}
