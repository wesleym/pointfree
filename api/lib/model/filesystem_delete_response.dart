//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilesystemDeleteResponse {
  /// Returns a new [FilesystemDeleteResponse] instance.
  FilesystemDeleteResponse({
    this.deletedIds = const [],
  });

  /// The unique identifiers of the filesystems that were deleted.
  List<String> deletedIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilesystemDeleteResponse &&
          _deepEquality.equals(other.deletedIds, deletedIds);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (deletedIds.hashCode);

  @override
  String toString() => 'FilesystemDeleteResponse[deletedIds=$deletedIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'deleted_ids'] = this.deletedIds;
    return json;
  }

  /// Returns a new [FilesystemDeleteResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FilesystemDeleteResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FilesystemDeleteResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FilesystemDeleteResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FilesystemDeleteResponse(
        deletedIds: json[r'deleted_ids'] is Iterable
            ? (json[r'deleted_ids'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<FilesystemDeleteResponse> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FilesystemDeleteResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilesystemDeleteResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FilesystemDeleteResponse> mapFromJson(dynamic json) {
    final map = <String, FilesystemDeleteResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FilesystemDeleteResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FilesystemDeleteResponse-objects as value to a dart map
  static Map<String, List<FilesystemDeleteResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FilesystemDeleteResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FilesystemDeleteResponse.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'deleted_ids',
  };
}
