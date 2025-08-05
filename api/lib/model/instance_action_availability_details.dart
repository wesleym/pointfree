//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstanceActionAvailabilityDetails {
  /// Returns a new [InstanceActionAvailabilityDetails] instance.
  InstanceActionAvailabilityDetails({
    required this.available,
    this.reasonCode,
    this.reasonDescription,
  });

  /// If set, indicates that the relevant operation can be performed on the instance in its current state.
  bool available;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  InstanceActionAvailabilityDetailsReasonCode? reasonCode;

  /// A longer description of why this operation is currently blocked. Only provided if the operation is blocked.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reasonDescription;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceActionAvailabilityDetails &&
          other.available == available &&
          other.reasonCode == reasonCode &&
          other.reasonDescription == reasonDescription;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (available.hashCode) +
      (reasonCode == null ? 0 : reasonCode!.hashCode) +
      (reasonDescription == null ? 0 : reasonDescription!.hashCode);

  @override
  String toString() =>
      'InstanceActionAvailabilityDetails[available=$available, reasonCode=$reasonCode, reasonDescription=$reasonDescription]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'available'] = this.available;
    if (this.reasonCode != null) {
      json[r'reason_code'] = this.reasonCode;
    } else {
      json[r'reason_code'] = null;
    }
    if (this.reasonDescription != null) {
      json[r'reason_description'] = this.reasonDescription;
    } else {
      json[r'reason_description'] = null;
    }
    return json;
  }

  /// Returns a new [InstanceActionAvailabilityDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InstanceActionAvailabilityDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "InstanceActionAvailabilityDetails[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "InstanceActionAvailabilityDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InstanceActionAvailabilityDetails(
        available: mapValueOfType<bool>(json, r'available')!,
        reasonCode: InstanceActionAvailabilityDetailsReasonCode.fromJson(
            json[r'reason_code']),
        reasonDescription: mapValueOfType<String>(json, r'reason_description'),
      );
    }
    return null;
  }

  static List<InstanceActionAvailabilityDetails> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InstanceActionAvailabilityDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InstanceActionAvailabilityDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InstanceActionAvailabilityDetails> mapFromJson(
      dynamic json) {
    final map = <String, InstanceActionAvailabilityDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InstanceActionAvailabilityDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InstanceActionAvailabilityDetails-objects as value to a dart map
  static Map<String, List<InstanceActionAvailabilityDetails>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InstanceActionAvailabilityDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InstanceActionAvailabilityDetails.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'available',
  };
}
