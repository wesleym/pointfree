//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GeneratedSSHKey {
  /// Returns a new [GeneratedSSHKey] instance.
  GeneratedSSHKey({
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
      other is GeneratedSSHKey &&
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
      'GeneratedSSHKey[id=$id, name=$name, publicKey=$publicKey, privateKey=$privateKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'public_key'] = this.publicKey;
    json[r'private_key'] = this.privateKey;
    return json;
  }

  /// Returns a new [GeneratedSSHKey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GeneratedSSHKey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GeneratedSSHKey[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GeneratedSSHKey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GeneratedSSHKey(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        publicKey: mapValueOfType<String>(json, r'public_key')!,
        privateKey: mapValueOfType<String>(json, r'private_key')!,
      );
    }
    return null;
  }

  static List<GeneratedSSHKey> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GeneratedSSHKey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GeneratedSSHKey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GeneratedSSHKey> mapFromJson(dynamic json) {
    final map = <String, GeneratedSSHKey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GeneratedSSHKey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GeneratedSSHKey-objects as value to a dart map
  static Map<String, List<GeneratedSSHKey>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GeneratedSSHKey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GeneratedSSHKey.listFromJson(
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
