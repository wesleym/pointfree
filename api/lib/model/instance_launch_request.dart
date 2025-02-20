//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceLaunchRequest {
  /// Returns a new [InstanceLaunchRequest] instance.
  InstanceLaunchRequest({
    required this.regionName,
    required this.instanceTypeName,
    this.sshKeyNames = const [],
    this.fileSystemNames = const [],
    this.name,
    this.image,
    this.userData,
  });

  /// The region into which you want to launch the instance.
  PublicRegionCode regionName;

  /// The type of instance you want to launch. To retrieve a list of available instance types, see [List available instance types](#get-/api/v1/instance-types).
  String instanceTypeName;

  /// The names of the SSH keys you want to use to provide access to the instance. Currently, exactly one SSH key must be specified.
  List<String> sshKeyNames;

  /// The names of the filesystems you want to attach to the instance. Currently, you can attach only one filesystem during instance creation. By default, no filesystems are attached.
  List<String> fileSystemNames;

  /// The name you want to assign to your instance. Must be 64 characters or fewer.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Image? image;

  /// An instance configuration string specified in a valid [cloud-init user-data](https://cloudinit.readthedocs.io/en/latest/explanation/format.html) format. You can use this field to configure your instance on launch. The user data string must be plain text and cannot exceed 1MB in size.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userData;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceLaunchRequest &&
          other.regionName == regionName &&
          other.instanceTypeName == instanceTypeName &&
          _deepEquality.equals(other.sshKeyNames, sshKeyNames) &&
          _deepEquality.equals(other.fileSystemNames, fileSystemNames) &&
          other.name == name &&
          other.image == image &&
          other.userData == userData;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (regionName.hashCode) +
      (instanceTypeName.hashCode) +
      (sshKeyNames.hashCode) +
      (fileSystemNames.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (image == null ? 0 : image!.hashCode) +
      (userData == null ? 0 : userData!.hashCode);

  @override
  String toString() =>
      'InstanceLaunchRequest[regionName=$regionName, instanceTypeName=$instanceTypeName, sshKeyNames=$sshKeyNames, fileSystemNames=$fileSystemNames, name=$name, image=$image, userData=$userData]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'region_name'] = this.regionName;
    json[r'instance_type_name'] = this.instanceTypeName;
    json[r'ssh_key_names'] = this.sshKeyNames;
    json[r'file_system_names'] = this.fileSystemNames;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
    if (this.userData != null) {
      json[r'user_data'] = this.userData;
    } else {
      json[r'user_data'] = null;
    }
    return json;
  }

  /// Returns a new [InstanceLaunchRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceLaunchRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceLaunchRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceLaunchRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceLaunchRequest(
        regionName: PublicRegionCode.fromJson(json[r'region_name'])!,
        instanceTypeName: mapValueOfType<String>(json, r'instance_type_name')!,
        sshKeyNames: json[r'ssh_key_names'] is Iterable
            ? (json[r'ssh_key_names'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        fileSystemNames: json[r'file_system_names'] is Iterable
            ? (json[r'file_system_names'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        name: mapValueOfType<String>(json, r'name'),
        image: Image.fromJson(json[r'image']),
        userData: mapValueOfType<String>(json, r'user_data'),
      );
    }
    return null;
  }

  static List<InstanceLaunchRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceLaunchRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceLaunchRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceLaunchRequest> mapFromJson(dynamic json) {
    final map = <String, InstanceLaunchRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceLaunchRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceLaunchRequest-objects as value to a dart map
  static Map<String, List<InstanceLaunchRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceLaunchRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceLaunchRequest.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'region_name',
    'instance_type_name',
    'ssh_key_names',
  };
}
