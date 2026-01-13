import '../main.dart';
import '../models/entities/contenitore_entity.dart';
import '../objectbox/objectbox.g.dart';

/// Repository for managing ContenitoreEntity objects in ObjectBox.
///
/// Provides methods to add, retrieve by ID, and retrieve all entities.
class ContenitoriRepository {
  final Box<ContenitoreEntity> _box;

  ContenitoriRepository() : _box = objectBox.store.box<ContenitoreEntity>();

  int add(ContenitoreEntity entity) {
    return _box.put(entity);
  }

  void put(ContenitoreEntity entity) {
    _box.put(entity);
  }

  ContenitoreEntity? get(int id) {
    return _box.get(id);
  }

  ContenitoreEntity? getById(int id) {
    return _box.get(id);
  }

  /// Retrieves all ContenitoreEntity objects, sorted by dataCaricamento.
  List<ContenitoreEntity> getAllSorted() {
    return _box.getAll()..sort((a, b) {
      final ad = a.dataCaricamento;
      final bd = b.dataCaricamento;

      if (ad == null && bd == null) return 0;
      if (ad == null) return -1;
      if (bd == null) return 1;

      return ad.compareTo(bd);
    });
  }
}
