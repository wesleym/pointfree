import 'dart:async';
import 'dart:developer';

import 'package:lambda_gui/src/filesystems/store.dart';
import 'package:openapi/api.dart';

const _ttl = Duration(minutes: 5);

class FilesystemsRepository {
  final _store = FilesystemsMemoryStore.instance;
  final _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
  Iterable<FileSystem> get filesystems => _store.list();
  final _controller = StreamController<Iterable<FileSystem>>.broadcast();
  Stream<Iterable<FileSystem>> get stream => _controller.stream;

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
  }
}
