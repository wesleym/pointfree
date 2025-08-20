import 'package:openapi/api.dart';

// TODO: Define store-level types rather than reusing the generated API types. This would allow customizing stringers and equality.

abstract class InstanceTypesStore {
  InstanceTypeEntry? getByName(String name);
  void put(InstanceTypeEntry instanceType);
  void putAll(Iterable<InstanceTypeEntry> instanceTypes);
  Iterable<InstanceTypeEntry> list();
}

class InstanceTypesMemoryStore implements InstanceTypesStore {
  static final instance = InstanceTypesMemoryStore();

  /// A mapping from instance type name to the data related to that instance type.
  final _instanceTypes = <String, InstanceTypeEntry>{};

  @override
  InstanceTypeEntry? getByName(String name) {
    return _instanceTypes[name];
  }

  @override
  Iterable<InstanceTypeEntry> list() => _instanceTypes.values;

  @override
  void put(InstanceTypeEntry instanceTypeEntry) =>
      _instanceTypes[instanceTypeEntry.instanceType.name] = instanceTypeEntry;

  @override
  void putAll(Iterable<InstanceTypeEntry> instanceTypes) {
    var entries = instanceTypes.map((it) => MapEntry(it.instanceType.name, it));
    _instanceTypes.addEntries(entries);
  }
}

class InstanceTypeEntry {
  final InstanceType instanceType;
  final List<Region> regionsWithCapacityAvailable;

  InstanceTypeEntry({
    required this.instanceType,
    required this.regionsWithCapacityAvailable,
  });
}
