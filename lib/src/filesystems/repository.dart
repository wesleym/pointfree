import 'dart:async';
import 'dart:developer';

import 'package:lambda_gui/src/filesystems/store.dart';
import 'package:openapi/api.dart';

const _ttl = Duration(minutes: 5);

class FilesystemsRepository {
  static final instance = FilesystemsRepository();

  final _store = FilesystemsMemoryStore.instance;
  var _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
  List<FileSystem> get filesystems => _store.list();
  final _controller = StreamController<List<FileSystem>>.broadcast();
  Stream<List<FileSystem>> get stream => _controller.stream;

  Future<void> update({bool force = false}) async {
    var now = DateTime.now();
    if (!force && _lastFetchTime.add(_ttl).isAfter(now)) return;

    final ListFileSystems200Response filesystems;
    try {
      final maybeFilesystems =
          await DefaultApi(defaultApiClient).listFileSystems();
      // This should never be null: an ApiException should have been thrown instead.
      filesystems = maybeFilesystems!;
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to instances: ${e.message}');
      return;
    }

    _store.putAll(filesystems.data);
    _controller.add(_store.list());
    _lastFetchTime = now;
  }

  FileSystem? getById(String filesystemId) => _store.get(filesystemId);
}
