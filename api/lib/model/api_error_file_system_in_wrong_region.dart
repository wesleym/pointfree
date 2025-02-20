//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiErrorFileSystemInWrongRegion {
  /// Returns a new [ApiErrorFileSystemInWrongRegion] instance.
  ApiErrorFileSystemInWrongRegion({
    this.code = 'instance-operations/launch/file-system-in-wrong-region',
    required this.message,
    this.suggestion,
  });

  /// The unique identifier for the type of error.
  String code;

  /// A description of the error.
  String message;

  /// One or more suggestions of possible ways to fix the error.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? suggestion;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiErrorFileSystemInWrongRegion &&
          other.code == code &&
          other.message == message &&
          other.suggestion == suggestion;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (code.hashCode) +
      (message.hashCode) +
      (suggestion == null ? 0 : suggestion!.hashCode);

  @override
  String toString() =>
      'ApiErrorFileSystemInWrongRegion[code=$code, message=$message, suggestion=$suggestion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'code'] = this.code;
    json[r'message'] = this.message;
    if (this.suggestion != null) {
      json[r'suggestion'] = this.suggestion;
    } else {
      json[r'suggestion'] = null;
    }
    return json;
  }

  /// Returns a new [ApiErrorFileSystemInWrongRegion] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApiErrorFileSystemInWrongRegion? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ApiErrorFileSystemInWrongRegion[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ApiErrorFileSystemInWrongRegion[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ApiErrorFileSystemInWrongRegion(
        code: mapValueOfType<String>(json, r'code')!,
        message: mapValueOfType<String>(json, r'message')!,
        suggestion: mapValueOfType<String>(json, r'suggestion'),
      );
    }
    return null;
  }

  static List<ApiErrorFileSystemInWrongRegion> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ApiErrorFileSystemInWrongRegion>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApiErrorFileSystemInWrongRegion.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApiErrorFileSystemInWrongRegion> mapFromJson(
      dynamic json) {
    final map = <String, ApiErrorFileSystemInWrongRegion>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApiErrorFileSystemInWrongRegion.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApiErrorFileSystemInWrongRegion-objects as value to a dart map
  static Map<String, List<ApiErrorFileSystemInWrongRegion>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ApiErrorFileSystemInWrongRegion>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApiErrorFileSystemInWrongRegion.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'code',
    'message',
  };
}
