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
  late final TextEditingController totalWeightController;
  late final TextEditingController containerWeightController;
  late final TextEditingController foodWeightController;
  late final TextEditingController portionController;
  late final TextEditingController portionWeightController;

  // Flag per evitare loop infiniti durante gli aggiornamenti automatici
  bool _isUpdating = false;

  DettaglioContenitoreCubit({
    required this.contenitoreId,
    ContenitoriRepository? repository,
  }) : _repository = repository ?? ContenitoriRepository(),
       super(DettaglioContenitoreInitial()) {
    _initControllers();
    _setupListeners();
    _loadContenitore();
  }

  void _initControllers() {
    nameController = TextEditingController();
    totalWeightController = TextEditingController();
    containerWeightController = TextEditingController();
    foodWeightController = TextEditingController();
    portionController = TextEditingController();
    portionWeightController = TextEditingController();
  }

  void _setupListeners() {
    totalWeightController.addListener(
      () => _onFieldChanged(_FieldType.totalWeight),
    );
    containerWeightController.addListener(
      () => _onFieldChanged(_FieldType.containerWeight),
    );
    foodWeightController.addListener(
      () => _onFieldChanged(_FieldType.foodWeight),
    );
    portionController.addListener(() => _onFieldChanged(_FieldType.portions));
    portionWeightController.addListener(
      () => _onFieldChanged(_FieldType.portionWeight),
    );
  }

  void _onFieldChanged(_FieldType changedField) {
    if (_isUpdating) return;

    final totalWeight = double.tryParse(totalWeightController.text);
    final containerWeight = double.tryParse(containerWeightController.text);
    final foodWeight = double.tryParse(foodWeightController.text);
    final portions = int.tryParse(portionController.text);
    final portionWeight = double.tryParse(portionWeightController.text);

    _isUpdating = true;

    try {
      switch (changedField) {
        case _FieldType.totalWeight:
          _updateFromTotalWeight(totalWeight, containerWeight, foodWeight);
          break;
        case _FieldType.containerWeight:
          _updateFromContainerWeight(totalWeight, containerWeight, foodWeight);
          break;
        case _FieldType.foodWeight:
          _updateFromFoodWeight(
            totalWeight,
            containerWeight,
            foodWeight,
            portions,
            portionWeight,
          );
          break;
        case _FieldType.portions:
          _updateFromPortions(foodWeight, portions, portionWeight);
          break;
        case _FieldType.portionWeight:
          _updateFromPortionWeight(foodWeight, portions, portionWeight);
          break;
      }
    } finally {
      _isUpdating = false;
    }
  }

  /// Aggiorna quando cambia il peso totale
  void _updateFromTotalWeight(
    double? totalWeight,
    double? containerWeight,
    double? foodWeight,
  ) {
    if (totalWeight == null || totalWeight <= 0) return;

    if (containerWeight != null && containerWeight > 0) {
      // Calcola peso cibo = peso totale - peso contenitore
      final newFoodWeight = totalWeight - containerWeight;
      if (newFoodWeight >= 0) {
        _updateController(foodWeightController, _formatDouble(newFoodWeight));
      }
    } else if (foodWeight != null && foodWeight >= 0) {
      // Calcola peso contenitore = peso totale - peso cibo
      final newContainerWeight = totalWeight - foodWeight;
      if (newContainerWeight >= 0) {
        _updateController(
          containerWeightController,
          _formatDouble(newContainerWeight),
        );
      }
    }
  }

  /// Aggiorna quando cambia il peso contenitore
  void _updateFromContainerWeight(
    double? totalWeight,
    double? containerWeight,
    double? foodWeight,
  ) {
    if (containerWeight == null || containerWeight < 0) return;

    if (totalWeight != null && totalWeight > 0) {
      // Calcola peso cibo = peso totale - peso contenitore
      final newFoodWeight = totalWeight - containerWeight;
      if (newFoodWeight >= 0) {
        _updateController(foodWeightController, _formatDouble(newFoodWeight));
      }
    } else if (foodWeight != null && foodWeight >= 0) {
      // Calcola peso totale = peso contenitore + peso cibo
      final newTotalWeight = containerWeight + foodWeight;
      _updateController(totalWeightController, _formatDouble(newTotalWeight));
    }
  }

  /// Aggiorna quando cambia il peso cibo
  void _updateFromFoodWeight(
    double? totalWeight,
    double? containerWeight,
    double? foodWeight,
    int? portions,
    double? portionWeight,
  ) {
    if (foodWeight == null || foodWeight < 0) return;

    // Calcoli relativi al peso totale
    if (containerWeight != null && containerWeight >= 0) {
      // Calcola peso totale = peso cibo + peso contenitore
      final newTotalWeight = foodWeight + containerWeight;
      _updateController(totalWeightController, _formatDouble(newTotalWeight));
    } else if (totalWeight != null && totalWeight > 0 && foodWeight > 0) {
      // Calcola peso contenitore = peso totale - peso cibo
      final newContainerWeight = totalWeight - foodWeight;
      if (newContainerWeight >= 0) {
        _updateController(
          containerWeightController,
          _formatDouble(newContainerWeight),
        );
      }
    }

    // Calcoli relativi alle porzioni (solo se foodWeight > 0)
    if (foodWeight <= 0) return;

    if (portions != null && portions > 0) {
      // Calcola peso porzione = peso cibo / porzioni
      final newPortionWeight = foodWeight / portions;
      _updateController(
        portionWeightController,
        _formatDouble(newPortionWeight),
      );
    } else if (portionWeight != null && portionWeight > 0) {
      // Calcola porzioni = peso cibo / peso porzione
      final newPortions = (foodWeight / portionWeight).round();
      if (newPortions > 0) {
        _updateController(portionController, newPortions.toString());
      }
    }
  }

  /// Aggiorna quando cambiano le porzioni
  void _updateFromPortions(
    double? foodWeight,
    int? portions,
    double? portionWeight,
  ) {
    if (portions == null || portions <= 0) return;

    if (foodWeight != null && foodWeight > 0) {
      // Calcola peso porzione = peso cibo / porzioni
      final newPortionWeight = foodWeight / portions;
      _updateController(
        portionWeightController,
        _formatDouble(newPortionWeight),
      );
    } else if (portionWeight != null && portionWeight > 0) {
      // Calcola peso cibo = porzioni * peso porzione
      final newFoodWeight = portions * portionWeight;
      _updateController(foodWeightController, _formatDouble(newFoodWeight));
    }
  }

  /// Aggiorna quando cambia il peso porzione
  void _updateFromPortionWeight(
    double? foodWeight,
    int? portions,
    double? portionWeight,
  ) {
    if (portionWeight == null || portionWeight <= 0) return;

    if (foodWeight != null && foodWeight > 0) {
      // Calcola porzioni = peso cibo / peso porzione
      final newPortions = (foodWeight / portionWeight).round();
      if (newPortions > 0) {
        _updateController(portionController, newPortions.toString());
      }
    } else if (portions != null && portions > 0) {
      // Calcola peso cibo = porzioni * peso porzione
      final newFoodWeight = portions * portionWeight;
      _updateController(foodWeightController, _formatDouble(newFoodWeight));
    }
  }

  void _updateController(TextEditingController controller, String value) {
    if (controller.text != value) {
      controller.text = value;
    }
  }

  String _formatDouble(double value) {
    // Rimuove decimali inutili (es. 100.0 -> 100)
    return value == value.roundToDouble()
        ? value.round().toString()
        : value.toStringAsFixed(2);
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
    totalWeightController.removeListener(
      () => _onFieldChanged(_FieldType.totalWeight),
    );
    containerWeightController.removeListener(
      () => _onFieldChanged(_FieldType.containerWeight),
    );
    foodWeightController.removeListener(
      () => _onFieldChanged(_FieldType.foodWeight),
    );
    portionController.removeListener(
      () => _onFieldChanged(_FieldType.portions),
    );
    portionWeightController.removeListener(
      () => _onFieldChanged(_FieldType.portionWeight),
    );
    nameController.dispose();
    totalWeightController.dispose();
    containerWeightController.dispose();
    foodWeightController.dispose();
    portionController.dispose();
    portionWeightController.dispose();
    return super.close();
  }
}

enum _FieldType {
  totalWeight,
  containerWeight,
  foodWeight,
  portions,
  portionWeight,
}
