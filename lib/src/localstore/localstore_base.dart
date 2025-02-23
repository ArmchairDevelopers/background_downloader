part of 'localstore.dart';

/// The entry point for accessing a [Localstore].
///
/// You can get an instance by calling [Localstore.instance], for example:
///
/// ```dart
/// final db = Localstore.instance;
/// ```
final class Localstore implements LocalstoreImpl {
  var _databaseDirectory = getApplicationSupportDirectory();
  final _delegate = DocumentRef._('');
  static final Localstore _localstore = Localstore._();

  /// Private initializer
  Localstore._();

  /// Returns an instance using the default [Localstore].
  static Localstore get instance => _localstore;

  Future<Directory> get databaseDirectory => _databaseDirectory;

  set databaseDirectory(Future<Directory> value) {
    _databaseDirectory = value;
  }

  /// Clears the cache - needed only if filesystem has been manipulated directly
  void clearCache() {
    Utils.instance.clearCache();
  }

  @override
  CollectionRef collection(String path) {
    return CollectionRef(path, null, _delegate);
  }
}
