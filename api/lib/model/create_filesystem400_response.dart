//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateFilesystem400Response {
  /// Returns a new [CreateFilesystem400Response] instance.
  CreateFilesystem400Response({
    required this.error,
  });

  Response3 error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateFilesystem400Response && other.error == error;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (error.hashCode);

  @override
  String toString() => 'CreateFilesystem400Response[error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'error'] = this.error;
    return json;
  }

  /// Returns a new [CreateFilesystem400Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateFilesystem400Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateFilesystem400Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateFilesystem400Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateFilesystem400Response(
        error: Response3.fromJson(json[r'error'])!,
      );
    }
    return null;
  }

  static List<CreateFilesystem400Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateFilesystem400Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateFilesystem400Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateFilesystem400Response> mapFromJson(dynamic json) {
    final map = <String, CreateFilesystem400Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateFilesystem400Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateFilesystem400Response-objects as value to a dart map
  static Map<String, List<CreateFilesystem400Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateFilesystem400Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateFilesystem400Response.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'error',
  };
}
