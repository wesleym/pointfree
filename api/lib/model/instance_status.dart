//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The current status of the instance.
class InstanceStatus {
  /// Instantiate a new enum with the provided [value].
  const InstanceStatus._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const booting = InstanceStatus._(r'booting');
  static const active = InstanceStatus._(r'active');
  static const unhealthy = InstanceStatus._(r'unhealthy');
  static const terminated = InstanceStatus._(r'terminated');
  static const terminating = InstanceStatus._(r'terminating');

  /// List of all possible values in this [enum][InstanceStatus].
  static const values = <InstanceStatus>[
    booting,
    active,
    unhealthy,
    terminated,
    terminating,
  ];

  static InstanceStatus? fromJson(dynamic value) =>
      InstanceStatusTypeTransformer().decode(value);

  static List<InstanceStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InstanceStatus] to String,
/// and [decode] dynamic data back to [InstanceStatus].
class InstanceStatusTypeTransformer {
  factory InstanceStatusTypeTransformer() =>
      _instance ??= const InstanceStatusTypeTransformer._();

  const InstanceStatusTypeTransformer._();

  String encode(InstanceStatus data) => data.value;

  /// Decodes a [dynamic value][data] to a InstanceStatus.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InstanceStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'booting':
          return InstanceStatus.booting;
        case r'active':
          return InstanceStatus.active;
        case r'unhealthy':
          return InstanceStatus.unhealthy;
        case r'terminated':
          return InstanceStatus.terminated;
        case r'terminating':
          return InstanceStatus.terminating;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [InstanceStatusTypeTransformer] instance.
  static InstanceStatusTypeTransformer? _instance;
}
