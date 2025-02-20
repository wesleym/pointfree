//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceRestartResponse {
  /// Returns a new [InstanceRestartResponse] instance.
  InstanceRestartResponse({
    this.restartedInstances = const [],
  });

  /// The list of instances that were successfully restarted.
  List<Instance> restartedInstances;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceRestartResponse &&
          _deepEquality.equals(other.restartedInstances, restartedInstances);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (restartedInstances.hashCode);

  @override
  String toString() =>
      'InstanceRestartResponse[restartedInstances=$restartedInstances]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'restarted_instances'] = this.restartedInstances;
    return json;
  }

  /// Returns a new [InstanceRestartResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceRestartResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceRestartResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceRestartResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceRestartResponse(
        restartedInstances: Instance.listFromJson(json[r'restarted_instances']),
      );
    }
    return null;
  }

  static List<InstanceRestartResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceRestartResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceRestartResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceRestartResponse> mapFromJson(dynamic json) {
    final map = <String, InstanceRestartResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceRestartResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceRestartResponse-objects as value to a dart map
  static Map<String, List<InstanceRestartResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceRestartResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceRestartResponse.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'restarted_instances',
  };
}
