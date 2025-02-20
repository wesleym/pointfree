//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiErrorUnauthorized {
  /// Returns a new [ApiErrorUnauthorized] instance.
  ApiErrorUnauthorized({
    this.code = 'global/invalid-api-key',
    this.message = 'API key was invalid, expired, or deleted.',
    this.suggestion = 'Check your API key or create a new one, then try again.',
  });

  /// The unique identifier for the type of error.
  String code;

  /// A description of the error.
  String message;

  /// One or more suggestions of possible ways to fix the error.
  String suggestion;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiErrorUnauthorized &&
          other.code == code &&
          other.message == message &&
          other.suggestion == suggestion;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (code.hashCode) + (message.hashCode) + (suggestion.hashCode);

  @override
  String toString() =>
      'ApiErrorUnauthorized[code=$code, message=$message, suggestion=$suggestion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'code'] = this.code;
    json[r'message'] = this.message;
    json[r'suggestion'] = this.suggestion;
    return json;
  }

  /// Returns a new [ApiErrorUnauthorized] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApiErrorUnauthorized? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ApiErrorUnauthorized[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ApiErrorUnauthorized[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ApiErrorUnauthorized(
        code: mapValueOfType<String>(json, r'code')!,
        message: mapValueOfType<String>(json, r'message')!,
        suggestion: mapValueOfType<String>(json, r'suggestion')!,
      );
    }
    return null;
  }

  static List<ApiErrorUnauthorized> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ApiErrorUnauthorized>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApiErrorUnauthorized.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApiErrorUnauthorized> mapFromJson(dynamic json) {
    final map = <String, ApiErrorUnauthorized>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApiErrorUnauthorized.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApiErrorUnauthorized-objects as value to a dart map
  static Map<String, List<ApiErrorUnauthorized>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ApiErrorUnauthorized>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApiErrorUnauthorized.listFromJson(
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
    'suggestion',
  };
}
