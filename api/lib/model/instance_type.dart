//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceType {
  /// Returns a new [InstanceType] instance.
  InstanceType({
    required this.name,
    required this.description,
    required this.gpuDescription,
    required this.priceCentsPerHour,
    required this.specs,
  });

  /// The name of the instance type.
  String name;

  /// A description of the instance type.
  String description;

  /// The type of GPU used by this instance type.
  String gpuDescription;

  /// The price of the instance type in US cents per hour.
  int priceCentsPerHour;

  /// Detailed technical specifications for the instance type.
  InstanceTypeSpecs specs;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceType &&
          other.name == name &&
          other.description == description &&
          other.gpuDescription == gpuDescription &&
          other.priceCentsPerHour == priceCentsPerHour &&
          other.specs == specs;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (description.hashCode) +
      (gpuDescription.hashCode) +
      (priceCentsPerHour.hashCode) +
      (specs.hashCode);

  @override
  String toString() =>
      'InstanceType[name=$name, description=$description, gpuDescription=$gpuDescription, priceCentsPerHour=$priceCentsPerHour, specs=$specs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'description'] = this.description;
    json[r'gpu_description'] = this.gpuDescription;
    json[r'price_cents_per_hour'] = this.priceCentsPerHour;
    json[r'specs'] = this.specs;
    return json;
  }

  /// Returns a new [InstanceType] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceType? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceType[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceType[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceType(
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description')!,
        gpuDescription: mapValueOfType<String>(json, r'gpu_description')!,
        priceCentsPerHour: mapValueOfType<int>(json, r'price_cents_per_hour')!,
        specs: InstanceTypeSpecs.fromJson(json[r'specs'])!,
      );
    }
    return null;
  }

  static List<InstanceType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceType> mapFromJson(dynamic json) {
    final map = <String, InstanceType>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceType.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceType-objects as value to a dart map
  static Map<String, List<InstanceType>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceType>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceType.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'description',
    'gpu_description',
    'price_cents_per_hour',
    'specs',
  };
}
