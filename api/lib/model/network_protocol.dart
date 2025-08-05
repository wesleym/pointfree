//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NetworkProtocol {
  /// Instantiate a new enum with the provided [value].
  const NetworkProtocol._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const tcp = NetworkProtocol._(r'tcp');
  static const udp = NetworkProtocol._(r'udp');
  static const icmp = NetworkProtocol._(r'icmp');
  static const all = NetworkProtocol._(r'all');

  /// List of all possible values in this [enum][NetworkProtocol].
  static const values = <NetworkProtocol>[
    tcp,
    udp,
    icmp,
    all,
  ];

  static NetworkProtocol? fromJson(dynamic value) =>
      NetworkProtocolTypeTransformer().decode(value);

  static List<NetworkProtocol> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NetworkProtocol>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NetworkProtocol.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [NetworkProtocol] to String,
/// and [decode] dynamic data back to [NetworkProtocol].
class NetworkProtocolTypeTransformer {
  factory NetworkProtocolTypeTransformer() =>
      _instance ??= const NetworkProtocolTypeTransformer._();

  const NetworkProtocolTypeTransformer._();

  String encode(NetworkProtocol data) => data.value;

  /// Decodes a [dynamic value][data] to a NetworkProtocol.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  NetworkProtocol? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'tcp':
          return NetworkProtocol.tcp;
        case r'udp':
          return NetworkProtocol.udp;
        case r'icmp':
          return NetworkProtocol.icmp;
        case r'all':
          return NetworkProtocol.all;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [NetworkProtocolTypeTransformer] instance.
  static NetworkProtocolTypeTransformer? _instance;
}
