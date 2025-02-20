//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Image {
  /// Returns a new [Image] instance.
  Image({
    required this.id,
    required this.family,
  });

  String id;

  /// The family name of the image.
  String family;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Image && other.id == id && other.family == family;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) + (family.hashCode);

  @override
  String toString() => 'Image[id=$id, family=$family]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'family'] = this.family;
    return json;
  }

  /// Returns a new [Image] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Image? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Image[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Image[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Image(
        id: mapValueOfType<String>(json, r'id')!,
        family: mapValueOfType<String>(json, r'family')!,
      );
    }
    return null;
  }

  static List<Image> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Image>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Image.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Image> mapFromJson(dynamic json) {
    final map = <String, Image>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Image.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Image-objects as value to a dart map
  static Map<String, List<Image>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Image>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Image.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'family',
  };
}
