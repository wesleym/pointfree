//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageSpecificationFamily {
  /// Returns a new [ImageSpecificationFamily] instance.
  ImageSpecificationFamily({
    required this.family,
  });

  /// The family name of the image.
  String family;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageSpecificationFamily && other.family == family;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (family.hashCode);

  @override
  String toString() => 'ImageSpecificationFamily[family=$family]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'family'] = this.family;
    return json;
  }

  /// Returns a new [ImageSpecificationFamily] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageSpecificationFamily? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ImageSpecificationFamily[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ImageSpecificationFamily[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageSpecificationFamily(
        family: mapValueOfType<String>(json, r'family')!,
      );
    }
    return null;
  }

  static List<ImageSpecificationFamily> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ImageSpecificationFamily>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageSpecificationFamily.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageSpecificationFamily> mapFromJson(dynamic json) {
    final map = <String, ImageSpecificationFamily>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImageSpecificationFamily.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageSpecificationFamily-objects as value to a dart map
  static Map<String, List<ImageSpecificationFamily>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ImageSpecificationFamily>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageSpecificationFamily.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'family',
  };
}
