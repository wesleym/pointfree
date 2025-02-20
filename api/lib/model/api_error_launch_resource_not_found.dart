//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiErrorLaunchResourceNotFound {
  /// Returns a new [ApiErrorLaunchResourceNotFound] instance.
  ApiErrorLaunchResourceNotFound({
    this.code = 'global/object-does-not-exist',
    required this.message,
    required this.suggestion,
  });

  /// The unique identifier for the type of error.
  String code;

  /// The resource the API was unable to find.
  String message;

  /// One or more suggestions of possible ways to fix the error.
  String suggestion;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiErrorLaunchResourceNotFound &&
          other.code == code &&
          other.message == message &&
          other.suggestion == suggestion;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (code.hashCode) + (message.hashCode) + (suggestion.hashCode);

  @override
  String toString() =>
      'ApiErrorLaunchResourceNotFound[code=$code, message=$message, suggestion=$suggestion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'code'] = this.code;
    json[r'message'] = this.message;
    json[r'suggestion'] = this.suggestion;
    return json;
  }

  /// Returns a new [ApiErrorLaunchResourceNotFound] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApiErrorLaunchResourceNotFound? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ApiErrorLaunchResourceNotFound[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ApiErrorLaunchResourceNotFound[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ApiErrorLaunchResourceNotFound(
        code: mapValueOfType<String>(json, r'code')!,
        message: mapValueOfType<String>(json, r'message')!,
        suggestion: mapValueOfType<String>(json, r'suggestion')!,
      );
    }
    return null;
  }

  static List<ApiErrorLaunchResourceNotFound> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ApiErrorLaunchResourceNotFound>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApiErrorLaunchResourceNotFound.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApiErrorLaunchResourceNotFound> mapFromJson(dynamic json) {
    final map = <String, ApiErrorLaunchResourceNotFound>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApiErrorLaunchResourceNotFound.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApiErrorLaunchResourceNotFound-objects as value to a dart map
  static Map<String, List<ApiErrorLaunchResourceNotFound>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ApiErrorLaunchResourceNotFound>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApiErrorLaunchResourceNotFound.listFromJson(
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
