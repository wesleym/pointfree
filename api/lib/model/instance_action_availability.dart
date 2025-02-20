//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceActionAvailability {
  /// Returns a new [InstanceActionAvailability] instance.
  InstanceActionAvailability({
    required this.migrate,
    required this.rebuild,
    required this.restart,
    required this.coldReboot,
    required this.terminate,
  });

  /// Indicates whether the instance is currently able to be migrated. If not, describes why the operation is blocked.
  InstanceActionAvailabilityDetails migrate;

  /// Indicates whether the instance is currently able to be rebuilt. If not, describes why the operation is blocked.
  InstanceActionAvailabilityDetails rebuild;

  /// Indicates whether the instance is currently able to be restarted. If not, describes why the operation is blocked.
  InstanceActionAvailabilityDetails restart;

  /// Indicates whether the instance is currently eligible for a cold reboot. If not, describes why the operation is blocked.
  InstanceActionAvailabilityDetails coldReboot;

  /// Indicates whether the instance is currently able to be terminated. If not, describes why the operation is blocked.
  InstanceActionAvailabilityDetails terminate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceActionAvailability &&
          other.migrate == migrate &&
          other.rebuild == rebuild &&
          other.restart == restart &&
          other.coldReboot == coldReboot &&
          other.terminate == terminate;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (migrate.hashCode) +
      (rebuild.hashCode) +
      (restart.hashCode) +
      (coldReboot.hashCode) +
      (terminate.hashCode);

  @override
  String toString() =>
      'InstanceActionAvailability[migrate=$migrate, rebuild=$rebuild, restart=$restart, coldReboot=$coldReboot, terminate=$terminate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'migrate'] = this.migrate;
    json[r'rebuild'] = this.rebuild;
    json[r'restart'] = this.restart;
    json[r'cold_reboot'] = this.coldReboot;
    json[r'terminate'] = this.terminate;
    return json;
  }

  /// Returns a new [InstanceActionAvailability] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceActionAvailability? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceActionAvailability[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceActionAvailability[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceActionAvailability(
        migrate: InstanceActionAvailabilityDetails.fromJson(json[r'migrate'])!,
        rebuild: InstanceActionAvailabilityDetails.fromJson(json[r'rebuild'])!,
        restart: InstanceActionAvailabilityDetails.fromJson(json[r'restart'])!,
        coldReboot:
            InstanceActionAvailabilityDetails.fromJson(json[r'cold_reboot'])!,
        terminate:
            InstanceActionAvailabilityDetails.fromJson(json[r'terminate'])!,
      );
    }
    return null;
  }

  static List<InstanceActionAvailability> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceActionAvailability>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceActionAvailability.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceActionAvailability> mapFromJson(dynamic json) {
    final map = <String, InstanceActionAvailability>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceActionAvailability.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceActionAvailability-objects as value to a dart map
  static Map<String, List<InstanceActionAvailability>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceActionAvailability>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceActionAvailability.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'migrate',
    'rebuild',
    'restart',
    'cold_reboot',
    'terminate',
  };
}
