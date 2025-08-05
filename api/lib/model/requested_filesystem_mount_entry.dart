//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequestedFilesystemMountEntry {
  /// Returns a new [RequestedFilesystemMountEntry] instance.
  RequestedFilesystemMountEntry({
    required this.mountPoint,
    required this.fileSystemId,
  });

  /// The absolute path indicating where on the instance the filesystem will be mounted.
  String mountPoint;

  /// The id of the filesystem to mount to the instance.
  String fileSystemId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestedFilesystemMountEntry &&
          other.mountPoint == mountPoint &&
          other.fileSystemId == fileSystemId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (mountPoint.hashCode) + (fileSystemId.hashCode);

  @override
  String toString() =>
      'RequestedFilesystemMountEntry[mountPoint=$mountPoint, fileSystemId=$fileSystemId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'mount_point'] = this.mountPoint;
    json[r'file_system_id'] = this.fileSystemId;
    return json;
  }

  /// Returns a new [RequestedFilesystemMountEntry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RequestedFilesystemMountEntry? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RequestedFilesystemMountEntry[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RequestedFilesystemMountEntry[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RequestedFilesystemMountEntry(
        mountPoint: mapValueOfType<String>(json, r'mount_point')!,
        fileSystemId: mapValueOfType<String>(json, r'file_system_id')!,
      );
    }
    return null;
  }

  static List<RequestedFilesystemMountEntry> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RequestedFilesystemMountEntry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RequestedFilesystemMountEntry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RequestedFilesystemMountEntry> mapFromJson(dynamic json) {
    final map = <String, RequestedFilesystemMountEntry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RequestedFilesystemMountEntry.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RequestedFilesystemMountEntry-objects as value to a dart map
  static Map<String, List<RequestedFilesystemMountEntry>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RequestedFilesystemMountEntry>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RequestedFilesystemMountEntry.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'mount_point',
    'file_system_id',
  };
}
