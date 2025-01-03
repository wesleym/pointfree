import 'package:openapi/api.dart';

// TODO: Define store-level types rather than reusing the generated API types. This would allow customizing stringers and equality.

abstract class FilesystemsStore {
  void put(FileSystem filesystem);
  void putAll(Iterable<FileSystem> filesystems);
  FileSystem? get(String filesystemId);
  Iterable<FileSystem> list();
}

class FilesystemsMemoryStore implements FilesystemsStore {
  static final instance = FilesystemsMemoryStore();

  /// A mapping from filesystem ID to filesystem.
  final _filesystems = <String, FileSystem>{};

  @override
  FileSystem? get(String filesystemId) => _filesystems[filesystemId];

  @override
  Iterable<FileSystem> list() => _filesystems.values;

  @override
  void put(FileSystem filesystem) => _filesystems[filesystem.id] = filesystem;

  @override
  void putAll(Iterable<FileSystem> filesystems) {
    var filesystemEntries = {for (final fs in filesystems) fs.id: fs};
    _filesystems.addAll(filesystemEntries);
  }
}
