import 'dart:async';
import 'dart:developer';

import 'package:pointfree/src/instances/store.dart';
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
      final maybeInstances =
          await InstancesApi(defaultApiClient).listInstances();
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

  Future<void> terminate(String id) async {
    try {
      await InstancesApi(defaultApiClient)
          .terminateInstance(InstanceTerminateRequest(instanceIds: [id]));
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to terminate instance with ID $id: ${e.message}');
      return;
    }

    await update(force: true);
  }

  Future<void> restart(String id) async {
    try {
      await InstancesApi(defaultApiClient)
          .restartInstance(InstanceRestartRequest(instanceIds: [id]));
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to restart instance with ID $id: ${e.message}');
      return;
    }

    await update(force: true);
  }

  Future<void> rename({required String id, required String? name}) async {
    try {
      await InstancesApi(defaultApiClient)
          .postInstance(id, InstanceModificationRequest(name: name));
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to rename instance with ID $id to $name: ${e.message}');
      return;
    }

    await update(force: true);
  }

  Future<void> launch({
    String? name,
    required String instanceTypeName,
    required PublicRegionCode regionCode,
    required String sshKeyName,
    String? filesystemName,
    InstanceLaunchRequestImage? image,
  }) async {
    final filesystemNames = [if (filesystemName != null) filesystemName];
    try {
      await InstancesApi(defaultApiClient).launchInstance(InstanceLaunchRequest(
        name: name,
        regionName: regionCode,
        instanceTypeName: instanceTypeName,
        sshKeyNames: [sshKeyName],
        fileSystemNames: filesystemNames,
        image: image,
      ));
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to launch instance: ${e.message}');
      return;
    }

    await update(force: true);
  }
}
