//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageArchitecture {
  /// Instantiate a new enum with the provided [value].
  const ImageArchitecture._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const x8664 = ImageArchitecture._(r'x86_64');
  static const arm64 = ImageArchitecture._(r'arm64');

  /// List of all possible values in this [enum][ImageArchitecture].
  static const values = <ImageArchitecture>[
    x8664,
    arm64,
  ];

  static ImageArchitecture? fromJson(dynamic value) =>
      ImageArchitectureTypeTransformer().decode(value);

  static List<ImageArchitecture> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ImageArchitecture>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageArchitecture.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ImageArchitecture] to String,
/// and [decode] dynamic data back to [ImageArchitecture].
class ImageArchitectureTypeTransformer {
  factory ImageArchitectureTypeTransformer() =>
      _instance ??= const ImageArchitectureTypeTransformer._();

  const ImageArchitectureTypeTransformer._();

  String encode(ImageArchitecture data) => data.value;

  /// Decodes a [dynamic value][data] to a ImageArchitecture.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ImageArchitecture? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'x86_64':
          return ImageArchitecture.x8664;
        case r'arm64':
          return ImageArchitecture.arm64;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ImageArchitectureTypeTransformer] instance.
  static ImageArchitectureTypeTransformer? _instance;
}
