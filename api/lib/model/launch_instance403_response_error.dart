//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LaunchInstance403ResponseError {
  /// Returns a new [LaunchInstance403ResponseError] instance.
  LaunchInstance403ResponseError({
    this.code = 'global/invalid-address',
    this.message = 'Your billing address is invalid.',
    this.suggestion =
        'Make sure your billing address is valid. Contact Support if problems continue.',
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
      other is LaunchInstance403ResponseError &&
          other.code == code &&
          other.message == message &&
          other.suggestion == suggestion;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (code.hashCode) + (message.hashCode) + (suggestion.hashCode);

  @override
  String toString() =>
      'LaunchInstance403ResponseError[code=$code, message=$message, suggestion=$suggestion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'code'] = this.code;
    json[r'message'] = this.message;
    json[r'suggestion'] = this.suggestion;
    return json;
  }

  /// Returns a new [LaunchInstance403ResponseError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LaunchInstance403ResponseError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "LaunchInstance403ResponseError[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "LaunchInstance403ResponseError[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LaunchInstance403ResponseError(
        code: mapValueOfType<String>(json, r'code')!,
        message: mapValueOfType<String>(json, r'message')!,
        suggestion: mapValueOfType<String>(json, r'suggestion')!,
      );
    }
    return null;
  }

  static List<LaunchInstance403ResponseError> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <LaunchInstance403ResponseError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LaunchInstance403ResponseError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LaunchInstance403ResponseError> mapFromJson(dynamic json) {
    final map = <String, LaunchInstance403ResponseError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LaunchInstance403ResponseError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LaunchInstance403ResponseError-objects as value to a dart map
  static Map<String, List<LaunchInstance403ResponseError>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<LaunchInstance403ResponseError>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LaunchInstance403ResponseError.listFromJson(
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
