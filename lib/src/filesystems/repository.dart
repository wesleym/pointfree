import 'dart:async';
import 'dart:developer';

import 'package:pointfree/src/filesystems/store.dart';
import 'package:lambda_cloud_dart_sdk/lambda_cloud_dart_sdk.dart';
import 'package:pointfree/src/login/store.dart';

const _ttl = Duration(minutes: 5);

class FilesystemsRepository {
  static final instance = FilesystemsRepository();

  final _store = FilesystemsMemoryStore.instance;
  var _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
  List<Filesystem> get filesystems => _store.list();
  final _controller = StreamController<List<Filesystem>>.broadcast();
  Stream<List<Filesystem>> get stream => _controller.stream;

  Future<void> update({bool force = false}) async {
    var now = DateTime.now();
    if (!force && _lastFetchTime.add(_ttl).isAfter(now)) return;

    await LoginStore.instance.waitForReady();

    final ListFilesystems200Response filesystems;
    try {
      final maybeFilesystems = await FilesystemsApi(
        defaultApiClient,
      ).listFilesystems();
      // This should never be null: an ApiException should have been thrown instead.
      filesystems = maybeFilesystems!;
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to update filesystems: ${e.message}');
      return;
    }

    _store
      ..clear()
      ..putAll(filesystems.data);
    _controller.add(_store.list());
    _lastFetchTime = now;
  }

  Future<void> create({
    required String name,
    required PublicRegionCode region,
  }) async {
    await LoginStore.instance.waitForReady();

    try {
      await FilesystemsApi(
        defaultApiClient,
      ).createFilesystem(FilesystemCreateRequest(name: name, region: region));
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to create filesystem: ${e.message}');
      return;
    }

    // TODO: Optimistic update.
    await update(force: true);
  }

  Future<void> delete({required String id}) async {
    await LoginStore.instance.waitForReady();

    try {
      await FilesystemsApi(defaultApiClient).filesystemDelete(id);
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to delete filesystem: ${e.message}');
      return;
    }

    // TODO: Optimistic update.
    await update(force: true);
  }

  Filesystem? getById(String filesystemId) => _store.get(filesystemId);
}
