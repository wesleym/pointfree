//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PublicRegionCode {
  /// Instantiate a new enum with the provided [value].
  const PublicRegionCode._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const europeCentral1 = PublicRegionCode._(r'europe-central-1');
  static const asiaSouth1 = PublicRegionCode._(r'asia-south-1');
  static const australiaEast1 = PublicRegionCode._(r'australia-east-1');
  static const meWest1 = PublicRegionCode._(r'me-west-1');
  static const asiaNortheast1 = PublicRegionCode._(r'asia-northeast-1');
  static const asiaNortheast2 = PublicRegionCode._(r'asia-northeast-2');
  static const usEast1 = PublicRegionCode._(r'us-east-1');
  static const usWest2 = PublicRegionCode._(r'us-west-2');
  static const usWest1 = PublicRegionCode._(r'us-west-1');
  static const usSouth1 = PublicRegionCode._(r'us-south-1');
  static const usWest3 = PublicRegionCode._(r'us-west-3');
  static const usMidwest1 = PublicRegionCode._(r'us-midwest-1');
  static const usEast2 = PublicRegionCode._(r'us-east-2');
  static const usSouth2 = PublicRegionCode._(r'us-south-2');
  static const usSouth3 = PublicRegionCode._(r'us-south-3');
  static const usEast3 = PublicRegionCode._(r'us-east-3');
  static const testEast1 = PublicRegionCode._(r'test-east-1');
  static const testWest1 = PublicRegionCode._(r'test-west-1');

  /// List of all possible values in this [enum][PublicRegionCode].
  static const values = <PublicRegionCode>[
    europeCentral1,
    asiaSouth1,
    australiaEast1,
    meWest1,
    asiaNortheast1,
    asiaNortheast2,
    usEast1,
    usWest2,
    usWest1,
    usSouth1,
    usWest3,
    usMidwest1,
    usEast2,
    usSouth2,
    usSouth3,
    usEast3,
    testEast1,
    testWest1,
  ];

  static PublicRegionCode? fromJson(dynamic value) =>
      PublicRegionCodeTypeTransformer().decode(value);

  static List<PublicRegionCode> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PublicRegionCode>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PublicRegionCode.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PublicRegionCode] to String,
/// and [decode] dynamic data back to [PublicRegionCode].
class PublicRegionCodeTypeTransformer {
  factory PublicRegionCodeTypeTransformer() =>
      _instance ??= const PublicRegionCodeTypeTransformer._();

  const PublicRegionCodeTypeTransformer._();

  String encode(PublicRegionCode data) => data.value;

  /// Decodes a [dynamic value][data] to a PublicRegionCode.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PublicRegionCode? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'europe-central-1':
          return PublicRegionCode.europeCentral1;
        case r'asia-south-1':
          return PublicRegionCode.asiaSouth1;
        case r'australia-east-1':
          return PublicRegionCode.australiaEast1;
        case r'me-west-1':
          return PublicRegionCode.meWest1;
        case r'asia-northeast-1':
          return PublicRegionCode.asiaNortheast1;
        case r'asia-northeast-2':
          return PublicRegionCode.asiaNortheast2;
        case r'us-east-1':
          return PublicRegionCode.usEast1;
        case r'us-west-2':
          return PublicRegionCode.usWest2;
        case r'us-west-1':
          return PublicRegionCode.usWest1;
        case r'us-south-1':
          return PublicRegionCode.usSouth1;
        case r'us-west-3':
          return PublicRegionCode.usWest3;
        case r'us-midwest-1':
          return PublicRegionCode.usMidwest1;
        case r'us-east-2':
          return PublicRegionCode.usEast2;
        case r'us-south-2':
          return PublicRegionCode.usSouth2;
        case r'us-south-3':
          return PublicRegionCode.usSouth3;
        case r'us-east-3':
          return PublicRegionCode.usEast3;
        case r'test-east-1':
          return PublicRegionCode.testEast1;
        case r'test-west-1':
          return PublicRegionCode.testWest1;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PublicRegionCodeTypeTransformer] instance.
  static PublicRegionCodeTypeTransformer? _instance;
}
