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
    _isUpdating = true;

    try {
      _calculateAllPossibleValues(changedField);
    } finally {
      _isUpdating = false;
    }
  }

  /// Calcola tutti i valori possibili basandosi sui dati disponibili
  void _calculateAllPossibleValues(_FieldType changedField) {
    // Leggi i valori attuali
    double? totalWeight = double.tryParse(totalWeightController.text);
    double? containerWeight = double.tryParse(containerWeightController.text);
    double? foodWeight = double.tryParse(foodWeightController.text);
    int? portions = int.tryParse(portionController.text);
    double? portionWeight = double.tryParse(portionWeightController.text);

    // === CALCOLI PESI (totalWeight, containerWeight, foodWeight) ===
    // Relazione: totalWeight = containerWeight + foodWeight

    // Se il campo modificato è nel gruppo pesi, calcola il terzo valore mancante
    if (changedField == _FieldType.totalWeight ||
        changedField == _FieldType.containerWeight ||
        changedField == _FieldType.foodWeight) {
      if (changedField == _FieldType.totalWeight &&
          totalWeight != null &&
          totalWeight > 0) {
        if (containerWeight != null && containerWeight >= 0) {
          final newFoodWeight = totalWeight - containerWeight;
          if (newFoodWeight >= 0) {
            _updateController(
              foodWeightController,
              _formatDouble(newFoodWeight),
            );
            foodWeight = newFoodWeight;
          }
        } else if (foodWeight != null && foodWeight >= 0) {
          final newContainerWeight = totalWeight - foodWeight;
          if (newContainerWeight >= 0) {
            _updateController(
              containerWeightController,
              _formatDouble(newContainerWeight),
            );
            containerWeight = newContainerWeight;
          }
        }
      }

      if (changedField == _FieldType.containerWeight &&
          containerWeight != null &&
          containerWeight >= 0) {
        if (totalWeight != null && totalWeight > 0) {
          final newFoodWeight = totalWeight - containerWeight;
          if (newFoodWeight >= 0) {
            _updateController(
              foodWeightController,
              _formatDouble(newFoodWeight),
            );
            foodWeight = newFoodWeight;
          }
        } else if (foodWeight != null && foodWeight >= 0) {
          final newTotalWeight = containerWeight + foodWeight;
          _updateController(
            totalWeightController,
            _formatDouble(newTotalWeight),
          );
          totalWeight = newTotalWeight;
        }
      }

      if (changedField == _FieldType.foodWeight &&
          foodWeight != null &&
          foodWeight >= 0) {
        if (containerWeight != null && containerWeight >= 0) {
          final newTotalWeight = foodWeight + containerWeight;
          _updateController(
            totalWeightController,
            _formatDouble(newTotalWeight),
          );
          totalWeight = newTotalWeight;
        } else if (totalWeight != null && totalWeight > 0) {
          final newContainerWeight = totalWeight - foodWeight;
          if (newContainerWeight >= 0) {
            _updateController(
              containerWeightController,
              _formatDouble(newContainerWeight),
            );
            containerWeight = newContainerWeight;
          }
        }
      }
    }

    // === CALCOLI PORZIONI (foodWeight, portions, portionWeight) ===
    // Relazione: foodWeight = portions * portionWeight

    if (changedField == _FieldType.portions &&
        portions != null &&
        portions > 0) {
      if (foodWeight != null && foodWeight > 0) {
        // Calcola peso porzione
        final newPortionWeight = foodWeight / portions;
        _updateController(
          portionWeightController,
          newPortionWeight.toStringAsFixed(2),
        );
        portionWeight = newPortionWeight;
      } else if (portionWeight != null && portionWeight > 0) {
        // Calcola peso cibo
        final newFoodWeight = portions * portionWeight;
        _updateController(foodWeightController, _formatDouble(newFoodWeight));
        foodWeight = newFoodWeight;
        // Ora prova a calcolare i pesi mancanti
        _recalculateWeights(totalWeight, containerWeight, foodWeight);
      }
    }

    if (changedField == _FieldType.portionWeight &&
        portionWeight != null &&
        portionWeight > 0) {
      if (foodWeight != null && foodWeight > 0) {
        // Calcola porzioni
        final newPortions = (foodWeight / portionWeight).round();
        if (newPortions > 0) {
          _updateController(portionController, newPortions.toString());
          portions = newPortions;
        }
      } else if (portions != null && portions > 0) {
        // Calcola peso cibo
        final newFoodWeight = portions * portionWeight;
        _updateController(foodWeightController, _formatDouble(newFoodWeight));
        foodWeight = newFoodWeight;
        // Ora prova a calcolare i pesi mancanti
        _recalculateWeights(totalWeight, containerWeight, foodWeight);
      }
    }

    // Se è cambiato foodWeight, aggiorna anche le porzioni se possibile
    if (changedField == _FieldType.foodWeight &&
        foodWeight != null &&
        foodWeight > 0) {
      if (portions != null && portions > 0) {
        final newPortionWeight = foodWeight / portions;
        _updateController(
          portionWeightController,
          newPortionWeight.toStringAsFixed(2),
        );
      } else if (portionWeight != null && portionWeight > 0) {
        final newPortions = (foodWeight / portionWeight).round();
        if (newPortions > 0) {
          _updateController(portionController, newPortions.toString());
        }
      }
    }

    // Se è cambiato totalWeight o containerWeight e abbiamo calcolato foodWeight,
    // aggiorna anche le porzioni se possibile
    if ((changedField == _FieldType.totalWeight ||
            changedField == _FieldType.containerWeight) &&
        foodWeight != null &&
        foodWeight > 0) {
      if (portions != null && portions > 0) {
        final newPortionWeight = foodWeight / portions;
        _updateController(
          portionWeightController,
          newPortionWeight.toStringAsFixed(2),
        );
      } else if (portionWeight != null && portionWeight > 0) {
        final newPortions = (foodWeight / portionWeight).round();
        if (newPortions > 0) {
          _updateController(portionController, newPortions.toString());
        }
      }
    }
  }

  /// Ricalcola totalWeight o containerWeight quando foodWeight cambia
  void _recalculateWeights(
    double? totalWeight,
    double? containerWeight,
    double? foodWeight,
  ) {
    if (foodWeight == null || foodWeight < 0) return;

    if (containerWeight != null && containerWeight >= 0) {
      final newTotalWeight = foodWeight + containerWeight;
      _updateController(totalWeightController, _formatDouble(newTotalWeight));
    } else if (totalWeight != null && totalWeight > 0) {
      final newContainerWeight = totalWeight - foodWeight;
      if (newContainerWeight >= 0) {
        _updateController(
          containerWeightController,
          _formatDouble(newContainerWeight),
        );
      }
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
