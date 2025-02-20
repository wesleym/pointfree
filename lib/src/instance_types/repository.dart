import 'dart:async';
import 'dart:developer';

import 'package:lambda_gui/src/instance_types/store.dart';
import 'package:openapi/api.dart';

const _ttl = Duration(hours: 1);

class InstanceTypesRepository {
  static final instance = InstanceTypesRepository();

  final _store = InstanceTypesMemoryStore.instance;
  var _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
  List<InstanceTypeEntry> get instanceTypes =>
      _store.list().toList(growable: false);
  final _controller = StreamController<List<InstanceTypeEntry>>.broadcast();
  Stream<List<InstanceTypeEntry>> get stream => _controller.stream;

  InstanceTypeEntry? getByName(String name) => _store.getByName(name);

  Future<void> update({bool force = false}) async {
    var now = DateTime.now();
    if (!force && _lastFetchTime.add(_ttl).isAfter(now)) return;

    final SvrExternalApiV1EndpointsInstanceTypesGet200Response instances;
    try {
      final maybeInstances = await InstancesApi(defaultApiClient)
          .svrExternalApiV1EndpointsInstanceTypesGet();
      // This should never be null: an ApiException should have been thrown instead.
      instances = maybeInstances!;
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to list instances: ${e.message}');
      return;
    }

    final entries = instances.data.values.map((e) => InstanceTypeEntry(
          instanceType: e.instanceType,
          regionsWithCapacityAvailable: e.regionsWithCapacityAvailable,
        ));
    _store.putAll(entries);
    _controller.add(_store.list().toList());
    _lastFetchTime = now;
  }
}
