//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';

// tests for InstanceLaunchRequest
void main() {
  // final instance = InstanceLaunchRequest();

  group('test InstanceLaunchRequest', () {
    // The region into which you want to launch the instance.
    // PublicRegionCode regionName
    test('to test the property `regionName`', () async {
      // TODO
    });

    // The type of instance you want to launch. To retrieve a list of available instance types, see [List available instance types](#get-/api/v1/instance-types).
    // String instanceTypeName
    test('to test the property `instanceTypeName`', () async {
      // TODO
    });

    // The names of the SSH keys you want to use to provide access to the instance. Currently, exactly one SSH key must be specified.
    // List<String> sshKeyNames (default value: const [])
    test('to test the property `sshKeyNames`', () async {
      // TODO
    });

    // The names of the filesystems you want to attach to the instance. Currently, you can attach only one filesystem during instance creation. By default, no filesystems are attached.
    // List<String> fileSystemNames (default value: const [])
    test('to test the property `fileSystemNames`', () async {
      // TODO
    });

    // The name you want to assign to your instance. Must be 64 characters or fewer.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Image image
    test('to test the property `image`', () async {
      // TODO
    });

    // An instance configuration string specified in a valid [cloud-init user-data](https://cloudinit.readthedocs.io/en/latest/explanation/format.html) format. You can use this field to configure your instance on launch. The user data string must be plain text and cannot exceed 1MB in size.
    // String userData
    test('to test the property `userData`', () async {
      // TODO
    });
  });
}
