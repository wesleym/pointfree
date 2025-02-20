//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecurityGroupRuleProtocol {
  /// Instantiate a new enum with the provided [value].
  const SecurityGroupRuleProtocol._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const tcp = SecurityGroupRuleProtocol._(r'tcp');
  static const udp = SecurityGroupRuleProtocol._(r'udp');
  static const icmp = SecurityGroupRuleProtocol._(r'icmp');
  static const all = SecurityGroupRuleProtocol._(r'all');

  /// List of all possible values in this [enum][SecurityGroupRuleProtocol].
  static const values = <SecurityGroupRuleProtocol>[
    tcp,
    udp,
    icmp,
    all,
  ];

  static SecurityGroupRuleProtocol? fromJson(dynamic value) =>
      SecurityGroupRuleProtocolTypeTransformer().decode(value);

  static List<SecurityGroupRuleProtocol> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SecurityGroupRuleProtocol>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecurityGroupRuleProtocol.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SecurityGroupRuleProtocol] to String,
/// and [decode] dynamic data back to [SecurityGroupRuleProtocol].
class SecurityGroupRuleProtocolTypeTransformer {
  factory SecurityGroupRuleProtocolTypeTransformer() =>
      _instance ??= const SecurityGroupRuleProtocolTypeTransformer._();

  const SecurityGroupRuleProtocolTypeTransformer._();

  String encode(SecurityGroupRuleProtocol data) => data.value;

  /// Decodes a [dynamic value][data] to a SecurityGroupRuleProtocol.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SecurityGroupRuleProtocol? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'tcp':
          return SecurityGroupRuleProtocol.tcp;
        case r'udp':
          return SecurityGroupRuleProtocol.udp;
        case r'icmp':
          return SecurityGroupRuleProtocol.icmp;
        case r'all':
          return SecurityGroupRuleProtocol.all;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SecurityGroupRuleProtocolTypeTransformer] instance.
  static SecurityGroupRuleProtocolTypeTransformer? _instance;
}
