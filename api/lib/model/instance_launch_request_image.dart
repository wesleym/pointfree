//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceLaunchRequestImage {
  /// Returns a new [InstanceLaunchRequestImage] instance.
  InstanceLaunchRequestImage({
    this.id,
    this.family,
  });

  String? id;

  /// The family name of the image.
  String? family;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceLaunchRequestImage &&
          other.id == id &&
          other.family == family;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) + (family.hashCode);

  @override
  String toString() => 'InstanceLaunchRequestImage[id=$id, family=$family]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = id;
    json[r'family'] = family;
    return json;
  }

  /// Returns a new [InstanceLaunchRequestImage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceLaunchRequestImage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceLaunchRequestImage[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceLaunchRequestImage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceLaunchRequestImage(
        id: mapValueOfType<String>(json, r'id'),
        family: mapValueOfType<String>(json, r'family'),
      );
    }
    return null;
  }

  static List<InstanceLaunchRequestImage> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceLaunchRequestImage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceLaunchRequestImage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceLaunchRequestImage> mapFromJson(dynamic json) {
    final map = <String, InstanceLaunchRequestImage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceLaunchRequestImage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceLaunchRequestImage-objects as value to a dart map
  static Map<String, List<InstanceLaunchRequestImage>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceLaunchRequestImage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceLaunchRequestImage.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
