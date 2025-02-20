//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceTypeSpecs {
  /// Returns a new [InstanceTypeSpecs] instance.
  InstanceTypeSpecs({
    required this.vcpus,
    required this.memoryGib,
    required this.storageGib,
    required this.gpus,
  });

  /// The number of virtual CPUs.
  int vcpus;

  /// The amount of RAM in gibibytes (GiB).
  int memoryGib;

  /// The amount of storage in gibibytes (GiB).
  int storageGib;

  /// The number of GPUs.
  int gpus;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceTypeSpecs &&
          other.vcpus == vcpus &&
          other.memoryGib == memoryGib &&
          other.storageGib == storageGib &&
          other.gpus == gpus;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (vcpus.hashCode) +
      (memoryGib.hashCode) +
      (storageGib.hashCode) +
      (gpus.hashCode);

  @override
  String toString() =>
      'InstanceTypeSpecs[vcpus=$vcpus, memoryGib=$memoryGib, storageGib=$storageGib, gpus=$gpus]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'vcpus'] = this.vcpus;
    json[r'memory_gib'] = this.memoryGib;
    json[r'storage_gib'] = this.storageGib;
    json[r'gpus'] = this.gpus;
    return json;
  }

  /// Returns a new [InstanceTypeSpecs] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceTypeSpecs? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceTypeSpecs[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceTypeSpecs[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceTypeSpecs(
        vcpus: mapValueOfType<int>(json, r'vcpus')!,
        memoryGib: mapValueOfType<int>(json, r'memory_gib')!,
        storageGib: mapValueOfType<int>(json, r'storage_gib')!,
        gpus: mapValueOfType<int>(json, r'gpus')!,
      );
    }
    return null;
  }

  static List<InstanceTypeSpecs> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceTypeSpecs>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceTypeSpecs.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceTypeSpecs> mapFromJson(dynamic json) {
    final map = <String, InstanceTypeSpecs>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceTypeSpecs.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceTypeSpecs-objects as value to a dart map
  static Map<String, List<InstanceTypeSpecs>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceTypeSpecs>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceTypeSpecs.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'vcpus',
    'memory_gib',
    'storage_gib',
    'gpus',
  };
}
