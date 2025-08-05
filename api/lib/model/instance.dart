//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Instance {
  /// Returns a new [Instance] instance.
  Instance({
    required this.id,
    this.name,
    this.ip,
    this.privateIp,
    required this.status,
    this.sshKeyNames = const [],
    this.fileSystemNames = const [],
    this.fileSystemMounts = const [],
    required this.region,
    required this.instanceType,
    this.hostname,
    this.jupyterToken,
    this.jupyterUrl,
    required this.actions,
    this.tags = const [],
    this.firewallRulesets = const [],
  });

  /// The unique identifier of the instance.
  String id;

  /// If set, the user-provided name of the instance.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The public IPv4 address of the instance.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ip;

  /// The private IPv4 address of the instance.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? privateIp;

  InstanceStatus status;

  /// The names of the SSH keys that are allowed to access the instance.
  List<String> sshKeyNames;

  /// The names of the filesystems mounted to the instance. If no filesystems are mounted, this array is empty.
  List<String> fileSystemNames;

  /// The filesystems, along with the mount paths, mounted to  the instances. If no filesystems are mounted, this parameter will be missing from the response.
  List<FilesystemMountEntry> fileSystemMounts;

  /// The region in which the instance is deployed.
  Region region;

  /// Detailed information about the instance's instance type.
  InstanceType instanceType;

  /// The hostname assigned to this instance, which resolves to the instance's IP.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostname;

  /// The secret token used to log into the JupyterLab server hosted on the instance.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? jupyterToken;

  /// The URL that opens the JupyterLab environment on the instance.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? jupyterUrl;

  /// A set of status objects representing the current availability of common instance operations.
  InstanceActionAvailability actions;

  /// Key/value pairs representing the instance's tags.
  List<TagEntry> tags;

  /// The firewall rulesets associated with this instance.
  List<FirewallRulesetEntry> firewallRulesets;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Instance &&
          other.id == id &&
          other.name == name &&
          other.ip == ip &&
          other.privateIp == privateIp &&
          other.status == status &&
          _deepEquality.equals(other.sshKeyNames, sshKeyNames) &&
          _deepEquality.equals(other.fileSystemNames, fileSystemNames) &&
          _deepEquality.equals(other.fileSystemMounts, fileSystemMounts) &&
          other.region == region &&
          other.instanceType == instanceType &&
          other.hostname == hostname &&
          other.jupyterToken == jupyterToken &&
          other.jupyterUrl == jupyterUrl &&
          other.actions == actions &&
          _deepEquality.equals(other.tags, tags) &&
          _deepEquality.equals(other.firewallRulesets, firewallRulesets);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (ip == null ? 0 : ip!.hashCode) +
      (privateIp == null ? 0 : privateIp!.hashCode) +
      (status.hashCode) +
      (sshKeyNames.hashCode) +
      (fileSystemNames.hashCode) +
      (fileSystemMounts.hashCode) +
      (region.hashCode) +
      (instanceType.hashCode) +
      (hostname == null ? 0 : hostname!.hashCode) +
      (jupyterToken == null ? 0 : jupyterToken!.hashCode) +
      (jupyterUrl == null ? 0 : jupyterUrl!.hashCode) +
      (actions.hashCode) +
      (tags.hashCode) +
      (firewallRulesets.hashCode);

  @override
  String toString() =>
      'Instance[id=$id, name=$name, ip=$ip, privateIp=$privateIp, status=$status, sshKeyNames=$sshKeyNames, fileSystemNames=$fileSystemNames, fileSystemMounts=$fileSystemMounts, region=$region, instanceType=$instanceType, hostname=$hostname, jupyterToken=$jupyterToken, jupyterUrl=$jupyterUrl, actions=$actions, tags=$tags, firewallRulesets=$firewallRulesets]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.ip != null) {
      json[r'ip'] = this.ip;
    } else {
      json[r'ip'] = null;
    }
    if (this.privateIp != null) {
      json[r'private_ip'] = this.privateIp;
    } else {
      json[r'private_ip'] = null;
    }
    json[r'status'] = this.status;
    json[r'ssh_key_names'] = this.sshKeyNames;
    json[r'file_system_names'] = this.fileSystemNames;
    json[r'file_system_mounts'] = this.fileSystemMounts;
    json[r'region'] = this.region;
    json[r'instance_type'] = this.instanceType;
    if (this.hostname != null) {
      json[r'hostname'] = this.hostname;
    } else {
      json[r'hostname'] = null;
    }
    if (this.jupyterToken != null) {
      json[r'jupyter_token'] = this.jupyterToken;
    } else {
      json[r'jupyter_token'] = null;
    }
    if (this.jupyterUrl != null) {
      json[r'jupyter_url'] = this.jupyterUrl;
    } else {
      json[r'jupyter_url'] = null;
    }
    json[r'actions'] = this.actions;
    json[r'tags'] = this.tags;
    json[r'firewall_rulesets'] = this.firewallRulesets;
    return json;
  }

  /// Returns a new [Instance] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Instance? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Instance[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Instance[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Instance(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name'),
        ip: mapValueOfType<String>(json, r'ip'),
        privateIp: mapValueOfType<String>(json, r'private_ip'),
        status: InstanceStatus.fromJson(json[r'status'])!,
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
        fileSystemMounts:
            FilesystemMountEntry.listFromJson(json[r'file_system_mounts']),
        region: Region.fromJson(json[r'region'])!,
        instanceType: InstanceType.fromJson(json[r'instance_type'])!,
        hostname: mapValueOfType<String>(json, r'hostname'),
        jupyterToken: mapValueOfType<String>(json, r'jupyter_token'),
        jupyterUrl: mapValueOfType<String>(json, r'jupyter_url'),
        actions: InstanceActionAvailability.fromJson(json[r'actions'])!,
        tags: TagEntry.listFromJson(json[r'tags']),
        firewallRulesets:
            FirewallRulesetEntry.listFromJson(json[r'firewall_rulesets']),
      );
    }
    return null;
  }

  static List<Instance> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Instance>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Instance.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Instance> mapFromJson(dynamic json) {
    final map = <String, Instance>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Instance.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Instance-objects as value to a dart map
  static Map<String, List<Instance>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Instance>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Instance.listFromJson(
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
    'status',
    'ssh_key_names',
    'file_system_names',
    'region',
    'instance_type',
    'actions',
  };
}
