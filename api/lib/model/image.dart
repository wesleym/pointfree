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
    required this.createdTime,
    required this.updatedTime,
    required this.name,
    required this.description,
    required this.family,
    required this.version,
    required this.architecture,
    required this.region,
  });

  /// The unique identifier (ID) for an image.
  String id;

  /// The date and time that the image was created.
  DateTime createdTime;

  /// The date and time that the image was last updated.
  DateTime updatedTime;

  /// The human-readable identifier for an image.
  String name;

  /// Additional information about the image.
  String description;

  /// The family the image belongs to.
  String family;

  /// The image version.
  String version;

  /// The CPU architecture the image supports.
  ImageArchitecture architecture;

  /// The region in which this image is available.
  Region region;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Image &&
          other.id == id &&
          other.createdTime == createdTime &&
          other.updatedTime == updatedTime &&
          other.name == name &&
          other.description == description &&
          other.family == family &&
          other.version == version &&
          other.architecture == architecture &&
          other.region == region;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (createdTime.hashCode) +
      (updatedTime.hashCode) +
      (name.hashCode) +
      (description.hashCode) +
      (family.hashCode) +
      (version.hashCode) +
      (architecture.hashCode) +
      (region.hashCode);

  @override
  String toString() =>
      'Image[id=$id, createdTime=$createdTime, updatedTime=$updatedTime, name=$name, description=$description, family=$family, version=$version, architecture=$architecture, region=$region]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'created_time'] = this.createdTime.toUtc().toIso8601String();
    json[r'updated_time'] = this.updatedTime.toUtc().toIso8601String();
    json[r'name'] = this.name;
    json[r'description'] = this.description;
    json[r'family'] = this.family;
    json[r'version'] = this.version;
    json[r'architecture'] = this.architecture;
    json[r'region'] = this.region;
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
        createdTime: mapDateTime(json, r'created_time', r'')!,
        updatedTime: mapDateTime(json, r'updated_time', r'')!,
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description')!,
        family: mapValueOfType<String>(json, r'family')!,
        version: mapValueOfType<String>(json, r'version')!,
        architecture: ImageArchitecture.fromJson(json[r'architecture'])!,
        region: Region.fromJson(json[r'region'])!,
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
    'created_time',
    'updated_time',
    'name',
    'description',
    'family',
    'version',
    'architecture',
    'region',
  };
}
