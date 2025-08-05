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

// tests for Instance
void main() {
  // final instance = Instance();

  group('test Instance', () {
    // The unique identifier of the instance.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // If set, the user-provided name of the instance.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // The public IPv4 address of the instance.
    // String ip
    test('to test the property `ip`', () async {
      // TODO
    });

    // The private IPv4 address of the instance.
    // String privateIp
    test('to test the property `privateIp`', () async {
      // TODO
    });

    // InstanceStatus status
    test('to test the property `status`', () async {
      // TODO
    });

    // The names of the SSH keys that are allowed to access the instance.
    // List<String> sshKeyNames (default value: const [])
    test('to test the property `sshKeyNames`', () async {
      // TODO
    });

    // The names of the filesystems mounted to the instance. If no filesystems are mounted, this array is empty.
    // List<String> fileSystemNames (default value: const [])
    test('to test the property `fileSystemNames`', () async {
      // TODO
    });

    // The filesystems, along with the mount paths, mounted to  the instances. If no filesystems are mounted, this parameter will be missing from the response.
    // List<FilesystemMountEntry> fileSystemMounts (default value: const [])
    test('to test the property `fileSystemMounts`', () async {
      // TODO
    });

    // The region in which the instance is deployed.
    // Region region
    test('to test the property `region`', () async {
      // TODO
    });

    // Detailed information about the instance's instance type.
    // InstanceType instanceType
    test('to test the property `instanceType`', () async {
      // TODO
    });

    // The hostname assigned to this instance, which resolves to the instance's IP.
    // String hostname
    test('to test the property `hostname`', () async {
      // TODO
    });

    // The secret token used to log into the JupyterLab server hosted on the instance.
    // String jupyterToken
    test('to test the property `jupyterToken`', () async {
      // TODO
    });

    // The URL that opens the JupyterLab environment on the instance.
    // String jupyterUrl
    test('to test the property `jupyterUrl`', () async {
      // TODO
    });

    // A set of status objects representing the current availability of common instance operations.
    // InstanceActionAvailability actions
    test('to test the property `actions`', () async {
      // TODO
    });

    // Key/value pairs representing the instance's tags.
    // List<TagEntry> tags (default value: const [])
    test('to test the property `tags`', () async {
      // TODO
    });

    // The firewall rulesets associated with this instance.
    // List<FirewallRulesetEntry> firewallRulesets (default value: const [])
    test('to test the property `firewallRulesets`', () async {
      // TODO
    });
  });
}
