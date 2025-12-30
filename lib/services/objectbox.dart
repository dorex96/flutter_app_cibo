import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../objectbox/objectbox.g.dart';

/// ObjectBox service for managing the database connection and store.
///
/// Provides methods to create and access the ObjectBox store.
class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(
      directory: p.join(docsDir.path, "obx-klstrl"),
    );
    return ObjectBox._create(store);
  }

  static Future<Store> append() async {
    final docsDir = await getApplicationDocumentsDirectory();
    return Store.attach(
      getObjectBoxModel(),
      p.join(docsDir.path, "obx-klstrl"),
    );
  }
}
