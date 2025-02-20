//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceActionUnavailableCode {
  /// Instantiate a new enum with the provided [value].
  const InstanceActionUnavailableCode._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const hasNotLaunched =
      InstanceActionUnavailableCode._(r'vm-has-not-launched');
  static const isTooOld = InstanceActionUnavailableCode._(r'vm-is-too-old');
  static const isTerminating =
      InstanceActionUnavailableCode._(r'vm-is-terminating');

  /// List of all possible values in this [enum][InstanceActionUnavailableCode].
  static const values = <InstanceActionUnavailableCode>[
    hasNotLaunched,
    isTooOld,
    isTerminating,
  ];

  static InstanceActionUnavailableCode? fromJson(dynamic value) =>
      InstanceActionUnavailableCodeTypeTransformer().decode(value);

  static List<InstanceActionUnavailableCode> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceActionUnavailableCode>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceActionUnavailableCode.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InstanceActionUnavailableCode] to String,
/// and [decode] dynamic data back to [InstanceActionUnavailableCode].
class InstanceActionUnavailableCodeTypeTransformer {
  factory InstanceActionUnavailableCodeTypeTransformer() =>
      _instance ??= const InstanceActionUnavailableCodeTypeTransformer._();

  const InstanceActionUnavailableCodeTypeTransformer._();

  String encode(InstanceActionUnavailableCode data) => data.value;

  /// Decodes a [dynamic value][data] to a InstanceActionUnavailableCode.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InstanceActionUnavailableCode? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'vm-has-not-launched':
          return InstanceActionUnavailableCode.hasNotLaunched;
        case r'vm-is-too-old':
          return InstanceActionUnavailableCode.isTooOld;
        case r'vm-is-terminating':
          return InstanceActionUnavailableCode.isTerminating;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [InstanceActionUnavailableCodeTypeTransformer] instance.
  static InstanceActionUnavailableCodeTypeTransformer? _instance;
}
