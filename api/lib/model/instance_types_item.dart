//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceTypesItem {
  /// Returns a new [InstanceTypesItem] instance.
  InstanceTypesItem({
    required this.instanceType,
    this.regionsWithCapacityAvailable = const [],
  });

  /// The description, technical specifications, and metadata for this instance type.
  InstanceType instanceType;

  /// A list of the regions in which this instance type is available.
  List<Region> regionsWithCapacityAvailable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceTypesItem &&
          other.instanceType == instanceType &&
          _deepEquality.equals(
              other.regionsWithCapacityAvailable, regionsWithCapacityAvailable);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (instanceType.hashCode) + (regionsWithCapacityAvailable.hashCode);

  @override
  String toString() =>
      'InstanceTypesItem[instanceType=$instanceType, regionsWithCapacityAvailable=$regionsWithCapacityAvailable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'instance_type'] = this.instanceType;
    json[r'regions_with_capacity_available'] =
        this.regionsWithCapacityAvailable;
    return json;
  }

  /// Returns a new [InstanceTypesItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceTypesItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceTypesItem[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceTypesItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceTypesItem(
        instanceType: InstanceType.fromJson(json[r'instance_type'])!,
        regionsWithCapacityAvailable:
            Region.listFromJson(json[r'regions_with_capacity_available']),
      );
    }
    return null;
  }

  static List<InstanceTypesItem> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceTypesItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceTypesItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceTypesItem> mapFromJson(dynamic json) {
    final map = <String, InstanceTypesItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceTypesItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceTypesItem-objects as value to a dart map
  static Map<String, List<InstanceTypesItem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceTypesItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceTypesItem.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'instance_type',
    'regions_with_capacity_available',
  };
}
