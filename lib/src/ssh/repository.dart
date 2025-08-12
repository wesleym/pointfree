import 'dart:async';
import 'dart:developer';

import 'package:pointfree/src/ssh/store.dart';
import 'package:openapi/api.dart';

const _ttl = Duration(minutes: 5);

class SshKeysRepository {
  static final instance = SshKeysRepository();

  final _store = SshKeysMemoryStore.instance;
  var _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
  List<SSHKey> get sshKeys => _store.list();
  final _controller = StreamController<List<SSHKey>>.broadcast();
  Stream<List<SSHKey>> get stream => _controller.stream;

  Future<void> update({bool force = false}) async {
    var now = DateTime.now();
    if (!force && _lastFetchTime.add(_ttl).isAfter(now)) return;

    final ListSSHKeys200Response sshKeys;
    try {
      final maybeSshKeys = await SSHKeysApi(defaultApiClient).listSSHKeys();
      // This should never be null: an ApiException should have been thrown instead.
      sshKeys = maybeSshKeys!;
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to instances: ${e.message}');
      return;
    }

    _store.putAll(sshKeys.data);
    _controller.add(_store.list());
    _lastFetchTime = now;
  }

  Future<void> delete(String id, {bool force = false}) async {
    try {
      await SSHKeysApi(defaultApiClient).deleteSSHKey(id);
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to delete SSH key with ID $id: ${e.message}');
      return;
    }

    _store.delete(id);
    // TODO: Does this race?
    await update(force: true);
    _controller.add(_store.list());
  }

  SSHKey? getById(String sshKeyId) => _store.get(sshKeyId);
}
