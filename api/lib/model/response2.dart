//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Response2 {
  /// Returns a new [Response2] instance.
  Response2({
    required this.id,
    required this.name,
    required this.publicKey,
    required this.privateKey,
  });

  /// The unique identifier (ID) of the SSH key.
  String id;

  /// The name of the SSH key.
  String name;

  /// The public key for the SSH key.
  String publicKey;

  /// The private key generated in the SSH key pair. Make sure to store a copy of this key locally, as Lambda does not store the key server-side.
  String privateKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Response2 &&
          other.id == id &&
          other.name == name &&
          other.publicKey == publicKey &&
          other.privateKey == privateKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (name.hashCode) +
      (publicKey.hashCode) +
      (privateKey.hashCode);

  @override
  String toString() =>
      'Response2[id=$id, name=$name, publicKey=$publicKey, privateKey=$privateKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'public_key'] = this.publicKey;
    json[r'private_key'] = this.privateKey;
    return json;
  }

  /// Returns a new [Response2] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Response2? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Response2[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Response2[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Response2(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        publicKey: mapValueOfType<String>(json, r'public_key')!,
        privateKey: mapValueOfType<String>(json, r'private_key')!,
      );
    }
    return null;
  }

  static List<Response2> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Response2>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Response2.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Response2> mapFromJson(dynamic json) {
    final map = <String, Response2>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Response2.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Response2-objects as value to a dart map
  static Map<String, List<Response2>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Response2>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Response2.listFromJson(
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
    'public_key',
    'private_key',
  };
}
