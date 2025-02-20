//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Filesystem {
  /// Returns a new [Filesystem] instance.
  Filesystem({
    required this.id,
    required this.name,
    required this.mountPoint,
    required this.created,
    required this.createdBy,
    required this.isInUse,
    required this.region,
    this.bytesUsed,
  });

  /// The unique identifier (ID) of the filesystem.
  String id;

  /// The name of the filesystem.
  String name;

  /// The absolute path indicating where on instances the filesystem will be mounted.
  String mountPoint;

  /// The date and time at which the filesystem was created. Formatted as an ISO 8601 timestamp.
  DateTime created;

  /// The user in your Team that created the filesystem.
  User createdBy;

  /// Whether the filesystem is currently in use by an instance. Filesystems that are in use cannot be deleted.
  bool isInUse;

  /// The region in which the filesystem is deployed.
  Region region;

  /// The approximate amount of storage used by the filesystem in bytes. This estimate is updated every few hours.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? bytesUsed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Filesystem &&
          other.id == id &&
          other.name == name &&
          other.mountPoint == mountPoint &&
          other.created == created &&
          other.createdBy == createdBy &&
          other.isInUse == isInUse &&
          other.region == region &&
          other.bytesUsed == bytesUsed;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (name.hashCode) +
      (mountPoint.hashCode) +
      (created.hashCode) +
      (createdBy.hashCode) +
      (isInUse.hashCode) +
      (region.hashCode) +
      (bytesUsed == null ? 0 : bytesUsed!.hashCode);

  @override
  String toString() =>
      'Filesystem[id=$id, name=$name, mountPoint=$mountPoint, created=$created, createdBy=$createdBy, isInUse=$isInUse, region=$region, bytesUsed=$bytesUsed]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'name'] = this.name;
    json[r'mount_point'] = this.mountPoint;
    json[r'created'] = this.created.toUtc().toIso8601String();
    json[r'created_by'] = this.createdBy;
    json[r'is_in_use'] = this.isInUse;
    json[r'region'] = this.region;
    if (this.bytesUsed != null) {
      json[r'bytes_used'] = this.bytesUsed;
    } else {
      json[r'bytes_used'] = null;
    }
    return json;
  }

  /// Returns a new [Filesystem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Filesystem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Filesystem[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Filesystem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Filesystem(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        mountPoint: mapValueOfType<String>(json, r'mount_point')!,
        created: mapDateTime(json, r'created', r'')!,
        createdBy: User.fromJson(json[r'created_by'])!,
        isInUse: mapValueOfType<bool>(json, r'is_in_use')!,
        region: Region.fromJson(json[r'region'])!,
        bytesUsed: mapValueOfType<int>(json, r'bytes_used'),
      );
    }
    return null;
  }

  static List<Filesystem> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Filesystem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Filesystem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Filesystem> mapFromJson(dynamic json) {
    final map = <String, Filesystem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Filesystem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Filesystem-objects as value to a dart map
  static Map<String, List<Filesystem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Filesystem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Filesystem.listFromJson(
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
    'mount_point',
    'created',
    'created_by',
    'is_in_use',
    'region',
  };
}
