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

/// tests for DefaultApi
void main() {
  // final instance = DefaultApi();

  group('tests for DefaultApi', () {
    // Add SSH key
    //
    // Add an SSH key  To use an existing key pair, enter the public key for the `public_key` property of the request body.  To generate a new key pair, omit the `public_key` property from the request body. Save the `private_key` from the response somewhere secure. For example, with curl:  ``` curl https://cloud.lambdalabs.com/api/v1/ssh-keys \\   --fail \\   -u ${LAMBDA_API_KEY}: \\   -X POST \\   -d '{\"name\": \"new key\"}' \\   | jq -r '.data.private_key' > key.pem  chmod 400 key.pem ```  Then, after you launch an instance with `new key` attached to it: ``` ssh -i key.pem <instance IP> ```
    //
    //Future<AddSSHKey200Response> addSSHKey(AddSSHKeyRequest addSSHKeyRequest) async
    test('test addSSHKey', () async {
      // TODO
    });

    // Delete SSH key
    //
    // Delete an SSH key.
    //
    //Future deleteSSHKey(String id) async
    test('test deleteSSHKey', () async {
      // TODO
    });

    // List details of a specific instance
    //
    // Retrieves details of a specific instance, including whether or not the instance is running.
    //
    //Future<GetInstance200Response> getInstance(String id) async
    test('test getInstance', () async {
      // TODO
    });

    // Retrieve list of offered instance types
    //
    // Returns a detailed list of the instance types offered by Lambda GPU Cloud. The details include the regions, if any, in which each instance type is currently available.
    //
    //Future<InstanceTypes200Response> instanceTypes() async
    test('test instanceTypes', () async {
      // TODO
    });

    // Launch instances
    //
    // Launches one or more instances of a given instance type.
    //
    //Future<LaunchInstance200Response> launchInstance(LaunchInstanceRequest launchInstanceRequest) async
    test('test launchInstance', () async {
      // TODO
    });

    // List file systems
    //
    // Retrieve the list of file systems
    //
    //Future<ListFileSystems200Response> listFileSystems() async
    test('test listFileSystems', () async {
      // TODO
    });

    // List running instances
    //
    // Retrieves a detailed list of running instances.
    //
    //Future<ListInstances200Response> listInstances() async
    test('test listInstances', () async {
      // TODO
    });

    // List SSH keys
    //
    // Retrieve the list of SSH keys
    //
    //Future<ListSSHKeys200Response> listSSHKeys() async
    test('test listSSHKeys', () async {
      // TODO
    });

    // Restart instances
    //
    // Restarts the given instances.
    //
    //Future<RestartInstance200Response> restartInstance(RestartInstanceRequest restartInstanceRequest) async
    test('test restartInstance', () async {
      // TODO
    });

    // Terminate an instance
    //
    // Terminates a given instance.
    //
    //Future<TerminateInstance200Response> terminateInstance(TerminateInstanceRequest terminateInstanceRequest) async
    test('test terminateInstance', () async {
      // TODO
    });
  });
}
