//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiErrorInvalidParameters {
  /// Returns a new [ApiErrorInvalidParameters] instance.
  ApiErrorInvalidParameters({
    this.code = 'global/invalid-parameters',
    this.message = 'Invalid request data.',
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
      other is ApiErrorInvalidParameters &&
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
      'ApiErrorInvalidParameters[code=$code, message=$message, suggestion=$suggestion]';

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

  /// Returns a new [ApiErrorInvalidParameters] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApiErrorInvalidParameters? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ApiErrorInvalidParameters[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ApiErrorInvalidParameters[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ApiErrorInvalidParameters(
        code: mapValueOfType<String>(json, r'code')!,
        message: mapValueOfType<String>(json, r'message')!,
        suggestion: mapValueOfType<String>(json, r'suggestion'),
      );
    }
    return null;
  }

  static List<ApiErrorInvalidParameters> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ApiErrorInvalidParameters>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApiErrorInvalidParameters.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApiErrorInvalidParameters> mapFromJson(dynamic json) {
    final map = <String, ApiErrorInvalidParameters>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApiErrorInvalidParameters.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApiErrorInvalidParameters-objects as value to a dart map
  static Map<String, List<ApiErrorInvalidParameters>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ApiErrorInvalidParameters>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApiErrorInvalidParameters.listFromJson(
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
