//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FirewallRule {
  /// Returns a new [FirewallRule] instance.
  FirewallRule({
    required this.protocol,
    this.portRange = const [],
    required this.sourceNetwork,
    required this.description,
  });

  /// The protocol to which the rule applies.
  SecurityGroupRuleProtocol protocol;

  /// An inclusive range of network ports specified as `[min, max]`. Not allowed for the `icmp` protocol but required for the others.  To specify a single port, list it twice (for example, `[22,22]`).
  List<int> portRange;

  /// The set of source IPv4 addresses from which you want to allow inbound traffic. These addresses must be specified in CIDR notation. You can specify individual public IPv4 CIDR blocks such as `1.2.3.4` or `1.2.3.4/32`, or you can specify `0.0.0.0/0` to allow access from any address.  This value is a string consisting of a public IPv4 address optionally followed by a slash (/) and an integer mask (the network prefix). If no mask is provided, the API assumes `/32` by default.
  String sourceNetwork;

  /// A human-readable description of the rule.
  String description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirewallRule &&
          other.protocol == protocol &&
          _deepEquality.equals(other.portRange, portRange) &&
          other.sourceNetwork == sourceNetwork &&
          other.description == description;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (protocol.hashCode) +
      (portRange.hashCode) +
      (sourceNetwork.hashCode) +
      (description.hashCode);

  @override
  String toString() =>
      'FirewallRule[protocol=$protocol, portRange=$portRange, sourceNetwork=$sourceNetwork, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'protocol'] = this.protocol;
    json[r'port_range'] = this.portRange;
    json[r'source_network'] = this.sourceNetwork;
    json[r'description'] = this.description;
    return json;
  }

  /// Returns a new [FirewallRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FirewallRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FirewallRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FirewallRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FirewallRule(
        protocol: SecurityGroupRuleProtocol.fromJson(json[r'protocol'])!,
        portRange: json[r'port_range'] is Iterable
            ? (json[r'port_range'] as Iterable)
                .cast<int>()
                .toList(growable: false)
            : const [],
        sourceNetwork: mapValueOfType<String>(json, r'source_network')!,
        description: mapValueOfType<String>(json, r'description')!,
      );
    }
    return null;
  }

  static List<FirewallRule> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FirewallRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FirewallRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FirewallRule> mapFromJson(dynamic json) {
    final map = <String, FirewallRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FirewallRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FirewallRule-objects as value to a dart map
  static Map<String, List<FirewallRule>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FirewallRule>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FirewallRule.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'protocol',
    'source_network',
    'description',
  };
}
