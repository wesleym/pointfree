//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FirewallRulesetCreateRequest {
  /// Returns a new [FirewallRulesetCreateRequest] instance.
  FirewallRulesetCreateRequest({
    required this.name,
    required this.region,
    this.rules = const [],
  });

  /// The name of the firewall ruleset.
  String name;

  /// The region in which the firewall ruleset is deployed.
  PublicRegionCode region;

  /// The firewall rules to include in the ruleset.
  List<FirewallRule> rules;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirewallRulesetCreateRequest &&
          other.name == name &&
          other.region == region &&
          _deepEquality.equals(other.rules, rules);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) + (region.hashCode) + (rules.hashCode);

  @override
  String toString() =>
      'FirewallRulesetCreateRequest[name=$name, region=$region, rules=$rules]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'region'] = this.region;
    json[r'rules'] = this.rules;
    return json;
  }

  /// Returns a new [FirewallRulesetCreateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FirewallRulesetCreateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FirewallRulesetCreateRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FirewallRulesetCreateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FirewallRulesetCreateRequest(
        name: mapValueOfType<String>(json, r'name')!,
        region: PublicRegionCode.fromJson(json[r'region'])!,
        rules: FirewallRule.listFromJson(json[r'rules']),
      );
    }
    return null;
  }

  static List<FirewallRulesetCreateRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FirewallRulesetCreateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FirewallRulesetCreateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FirewallRulesetCreateRequest> mapFromJson(dynamic json) {
    final map = <String, FirewallRulesetCreateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FirewallRulesetCreateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FirewallRulesetCreateRequest-objects as value to a dart map
  static Map<String, List<FirewallRulesetCreateRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FirewallRulesetCreateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FirewallRulesetCreateRequest.listFromJson(
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
    'rules',
  };
}
