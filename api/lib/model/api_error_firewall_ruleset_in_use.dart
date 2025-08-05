//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiErrorFirewallRulesetInUse {
  /// Returns a new [ApiErrorFirewallRulesetInUse] instance.
  ApiErrorFirewallRulesetInUse({
    this.code = 'firewall-rulesets/firewall-ruleset-in-use',
    this.message = 'Firewall ruleset is in use by one or more instances.',
    this.suggestion =
        'Terminate all instances that are using the ruleset before deleting it.',
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
      other is ApiErrorFirewallRulesetInUse &&
          other.code == code &&
          other.message == message &&
          other.suggestion == suggestion;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (code.hashCode) + (message.hashCode) + (suggestion.hashCode);

  @override
  String toString() =>
      'ApiErrorFirewallRulesetInUse[code=$code, message=$message, suggestion=$suggestion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'code'] = this.code;
    json[r'message'] = this.message;
    json[r'suggestion'] = this.suggestion;
    return json;
  }

  /// Returns a new [ApiErrorFirewallRulesetInUse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApiErrorFirewallRulesetInUse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ApiErrorFirewallRulesetInUse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ApiErrorFirewallRulesetInUse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ApiErrorFirewallRulesetInUse(
        code: mapValueOfType<String>(json, r'code')!,
        message: mapValueOfType<String>(json, r'message')!,
        suggestion: mapValueOfType<String>(json, r'suggestion')!,
      );
    }
    return null;
  }

  static List<ApiErrorFirewallRulesetInUse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ApiErrorFirewallRulesetInUse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApiErrorFirewallRulesetInUse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApiErrorFirewallRulesetInUse> mapFromJson(dynamic json) {
    final map = <String, ApiErrorFirewallRulesetInUse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApiErrorFirewallRulesetInUse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApiErrorFirewallRulesetInUse-objects as value to a dart map
  static Map<String, List<ApiErrorFirewallRulesetInUse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ApiErrorFirewallRulesetInUse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApiErrorFirewallRulesetInUse.listFromJson(
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
