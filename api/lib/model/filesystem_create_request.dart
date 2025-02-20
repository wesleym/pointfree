//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilesystemCreateRequest {
  /// Returns a new [FilesystemCreateRequest] instance.
  FilesystemCreateRequest({
    required this.name,
    required this.region,
  });

  /// The name of the filesystem.
  String name;

  /// The region in which you want to create the filesystem.
  PublicRegionCode region;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilesystemCreateRequest &&
          other.name == name &&
          other.region == region;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) + (region.hashCode);

  @override
  String toString() => 'FilesystemCreateRequest[name=$name, region=$region]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'region'] = this.region;
    return json;
  }

  /// Returns a new [FilesystemCreateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FilesystemCreateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FilesystemCreateRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FilesystemCreateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FilesystemCreateRequest(
        name: mapValueOfType<String>(json, r'name')!,
        region: PublicRegionCode.fromJson(json[r'region'])!,
      );
    }
    return null;
  }

  static List<FilesystemCreateRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FilesystemCreateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilesystemCreateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FilesystemCreateRequest> mapFromJson(dynamic json) {
    final map = <String, FilesystemCreateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FilesystemCreateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FilesystemCreateRequest-objects as value to a dart map
  static Map<String, List<FilesystemCreateRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FilesystemCreateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FilesystemCreateRequest.listFromJson(
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
    'region',
  };
}
