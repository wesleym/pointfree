//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FirewallRuleset {
  /// Returns a new [FirewallRuleset] instance.
  FirewallRuleset({
    required this.id,
    required this.name,
    required this.region,
    this.rules = const [],
    required this.created,
    this.instanceIds = const [],
  });

  /// The unique identifier of the firewall ruleset.
  String id;

  /// The name of the firewall ruleset.
  String name;

  /// The region in which the firewall ruleset is deployed.
  Region region;

  /// The list of firewall rules in this ruleset.
  List<FirewallRule> rules;

  /// The date and time at which the firewall ruleset was created. Formatted as an ISO 8601 timestamp.
  DateTime created;

  /// The IDs of instances this firewall ruleset is associated with.
  List<String> instanceIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirewallRuleset &&
          other.id == id &&
          other.name == name &&
          other.region == region &&
          _deepEquality.equals(other.rules, rules) &&
          other.created == created &&
          _deepEquality.equals(other.instanceIds, instanceIds);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (name.hashCode) +
      (region.hashCode) +
      (rules.hashCode) +
      (created.hashCode) +
      (instanceIds.hashCode);

  @override
  String toString() =>
      'FirewallRuleset[id=$id, name=$name, region=$region, rules=$rules, created=$created, instanceIds=$instanceIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'region'] = this.region;
    json[r'rules'] = this.rules;
    json[r'created'] = this.created.toUtc().toIso8601String();
    json[r'instance_ids'] = this.instanceIds;
    return json;
  }

  /// Returns a new [FirewallRuleset] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FirewallRuleset? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FirewallRuleset[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FirewallRuleset[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FirewallRuleset(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        region: Region.fromJson(json[r'region'])!,
        rules: FirewallRule.listFromJson(json[r'rules']),
        created: mapDateTime(json, r'created', r'')!,
        instanceIds: json[r'instance_ids'] is Iterable
            ? (json[r'instance_ids'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<FirewallRuleset> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FirewallRuleset>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FirewallRuleset.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FirewallRuleset> mapFromJson(dynamic json) {
    final map = <String, FirewallRuleset>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FirewallRuleset.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FirewallRuleset-objects as value to a dart map
  static Map<String, List<FirewallRuleset>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FirewallRuleset>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FirewallRuleset.listFromJson(
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
    'name',
    'region',
    'rules',
    'created',
    'instance_ids',
  };
}
