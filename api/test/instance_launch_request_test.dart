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

    // The names of the filesystems you want to mount to the instance. When specified alongside `file_system_mounts`, any filesystems referred to in both lists will use the mount path specified in `file_system_mounts`, rather than the default.
    // List<String> fileSystemNames (default value: const [])
    test('to test the property `fileSystemNames`', () async {
      // TODO
    });

    // The filesystem mounts to mount to the instance. When specified alongside  `file_system_names`, any filesystems referred to in both lists will use the mount path specified in `file_system_mounts`, rather than the default.
    // List<RequestedFilesystemMountEntry> fileSystemMounts (default value: const [])
    test('to test the property `fileSystemMounts`', () async {
      // TODO
    });

    // The hostname to assign to the instance. If not specified, a default, IP-address-based hostname is assigned. This hostname is driven into /etc/hostname on the instance.
    // String hostname
    test('to test the property `hostname`', () async {
      // TODO
    });

    // The name you want to assign to your instance. Must be 64 characters or fewer.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // InstanceLaunchRequestImage image
    test('to test the property `image`', () async {
      // TODO
    });

    // An instance configuration string specified in a valid [cloud-init user-data](https://cloudinit.readthedocs.io/en/latest/explanation/format.html) format. You can use this field to configure your instance on launch. The user data string must be plain text and cannot exceed 1MB in size.
    // String userData
    test('to test the property `userData`', () async {
      // TODO
    });

    // Key/value pairs representing the instance's tags.
    // List<RequestedTagEntry> tags (default value: const [])
    test('to test the property `tags`', () async {
      // TODO
    });

    // The firewall rulesets to associate with the instance. The firewall rulesets must exist in the same region as the instance.
    // List<FirewallRulesetEntry> firewallRulesets (default value: const [])
    test('to test the property `firewallRulesets`', () async {
      // TODO
    });
  });
}
