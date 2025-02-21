import 'package:openapi/api.dart';

// TODO: Define store-level types rather than reusing the generated API types. This would allow customizing stringers and equality.

abstract class InstancesStore {
  void put(Instance instance);
  void putAll(Iterable<Instance> instances);
  Instance? get(String instanceId);
  Iterable<Instance> list();
  void delete(String instanceId);
}

class InstancesMemoryStore implements InstancesStore {
  static final instance = InstancesMemoryStore();

  /// A mapping from instance ID to instance.
  final _instances = <String, Instance>{};

  @override
  Instance? get(String instanceId) => _instances[instanceId];

  @override
  List<Instance> list() => _instances.values.toList(growable: false);

  @override
  void put(Instance instance) => _instances[instance.id] = instance;

  @override
  void putAll(Iterable<Instance> instances) {
    var instanceEntries = {for (final k in instances) k.id: k};
    _instances.addAll(instanceEntries);
  }

  @override
  void delete(String instanceId) => _instances.remove(instanceId);
}
