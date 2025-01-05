import 'dart:async';
import 'dart:developer';

import 'package:lambda_gui/src/instances/store.dart';
import 'package:openapi/api.dart';

const _ttl = Duration(minutes: 5);

class InstancesRepository {
  static final instance = InstancesRepository();

  final _store = InstancesMemoryStore.instance;
  var _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
  List<Instance> get instances => _store.list();
  final _controller = StreamController<List<Instance>>.broadcast();
  Stream<List<Instance>> get stream => _controller.stream;

  Future<void> update({bool force = false}) async {
    var now = DateTime.now();
    if (!force && _lastFetchTime.add(_ttl).isAfter(now)) return;

    final ListInstances200Response instances;
    try {
      final maybeInstances = await DefaultApi(defaultApiClient).listInstances();
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to list instances: ${e.message}');
      return;
    }

    _store.putAll(instances.data);
    _controller.add(_store.list());
    _lastFetchTime = now;
  }

  Future<void> terminate(String id, {bool force = false}) async {
    try {
      await DefaultApi(defaultApiClient)
          .terminateInstance(TerminateInstanceRequest(instanceIds: [id]));
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to terminate instance with ID $id: ${e.message}');
      return;
    }

    await update(force: true);
  }

  Future<void> launch({
    String? name,
    required String instanceTypeName,
    required String regionCode,
    required String sshKeyName,
    String? filesystemName,
  }) async {
    final filesystemNames = [if (filesystemName != null) filesystemName];
    try {
      await DefaultApi(defaultApiClient).launchInstance(LaunchInstanceRequest(
        name: name,
        regionName: regionCode,
        instanceTypeName: instanceTypeName,
        sshKeyNames: [sshKeyName],
        fileSystemNames: filesystemNames,
      ));
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to launch instance: ${e.message}');
      return;
    }

    await update(force: true);
  }
}
