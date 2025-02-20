//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiErrorQuotaExceeded {
  /// Returns a new [ApiErrorQuotaExceeded] instance.
  ApiErrorQuotaExceeded({
    this.code = 'global/quota-exceeded',
    this.message = 'Quota exceeded.',
    this.suggestion = 'Contact Support to increase your quota.',
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
      other is ApiErrorQuotaExceeded &&
          other.code == code &&
          other.message == message &&
          other.suggestion == suggestion;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (code.hashCode) + (message.hashCode) + (suggestion.hashCode);

  @override
  String toString() =>
      'ApiErrorQuotaExceeded[code=$code, message=$message, suggestion=$suggestion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'code'] = this.code;
    json[r'message'] = this.message;
    json[r'suggestion'] = this.suggestion;
    return json;
  }

  /// Returns a new [ApiErrorQuotaExceeded] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApiErrorQuotaExceeded? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ApiErrorQuotaExceeded[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ApiErrorQuotaExceeded[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ApiErrorQuotaExceeded(
        code: mapValueOfType<String>(json, r'code')!,
        message: mapValueOfType<String>(json, r'message')!,
        suggestion: mapValueOfType<String>(json, r'suggestion')!,
      );
    }
    return null;
  }

  static List<ApiErrorQuotaExceeded> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ApiErrorQuotaExceeded>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApiErrorQuotaExceeded.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApiErrorQuotaExceeded> mapFromJson(dynamic json) {
    final map = <String, ApiErrorQuotaExceeded>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApiErrorQuotaExceeded.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApiErrorQuotaExceeded-objects as value to a dart map
  static Map<String, List<ApiErrorQuotaExceeded>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ApiErrorQuotaExceeded>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApiErrorQuotaExceeded.listFromJson(
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
