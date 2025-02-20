import 'package:openapi/api.dart';

// TODO: Define store-level types rather than reusing the generated API types. This would allow customizing stringers and equality.

abstract class FilesystemsStore {
  void put(Filesystem filesystem);
  void putAll(Iterable<Filesystem> filesystems);
  Filesystem? get(String filesystemId);
  Iterable<Filesystem> list();
  void clear();
}

class FilesystemsMemoryStore implements FilesystemsStore {
  static final instance = FilesystemsMemoryStore();

  /// A mapping from filesystem ID to filesystem.
  final _filesystems = <String, Filesystem>{};

  @override
  Filesystem? get(String filesystemId) => _filesystems[filesystemId];

  @override
  List<Filesystem> list() => _filesystems.values.toList(growable: false);

  @override
  void put(Filesystem filesystem) => _filesystems[filesystem.id] = filesystem;

  @override
  void putAll(Iterable<Filesystem> filesystems) {
    var filesystemEntries = {for (final fs in filesystems) fs.id: fs};
    _filesystems.addAll(filesystemEntries);
  }

  @override
  void clear() => _filesystems.clear();
}
