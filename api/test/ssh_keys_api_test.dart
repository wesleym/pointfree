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

/// tests for SSHKeysApi
void main() {
  // final instance = SSHKeysApi();

  group('tests for SSHKeysApi', () {
    // Add an SSH key
    //
    //  Add an SSH key to your Lambda Cloud account. You can upload an existing public key, or you can generate a new key pair.  -  To use an existing key pair, set the `public_key` property in the request body    to your public key.  -  To generate a new key pair, omit the `public_key` property from the request    body.  <div style=\"border: 0.075rem solid #E48603; border-radius: .2rem; font-size: 13px;   box-shadow: 0 0.2rem 0.5rem #0000000d,0 0 0.05rem #0000001a\">   <div style=\"background-color: #E486031a; padding: .4rem 2rem .4rem .6rem; font-weight: bold;\">Important</div>   <div style=\"background-color: transparent; padding: .4rem .6rem; line-height: 1.4;\">Lambda doesn't   store your private key after it's been generated. If you generate a new key pair, make sure to save   the resulting private key locally.</div> </div>  For example, to generate a new key pair and associate it with a Lambda On-Demand Cloud instance:  1. Generate the key pair. The command provided below automatically extracts and     saves the returned private key to a new file called `key.pem`. Replace     `<NEW-KEY-NAME>` with the name you want to assign to the SSH key:      ```     curl https://cloud.lambda.ai/api/v1/ssh-keys \\     --fail \\     -u ${LAMBDA_API_KEY}: \\     -X POST \\     -d '{\"name\": \"<NEW-KEY-NAME>\"}' \\     | jq -r '.data.private_key' > key.pem     ```  2. Next, set the private key's permissions to read-only:      ```     chmod 400 key.pem     ```  3. Launch a new instance. Replace `<NEW-KEY-NAME>` with the name you assigned    to your SSH key.      ```     curl -X POST \"https://cloud.lambda.ai/api/v1/instance-operations/launch\" \\     --fail \\     -u ${LAMBDA_API_KEY}: \\     -X POST \\     -d '{\"region_name\":\"us-west-1\",\"instance_type_name\":\"gpu_1x_a10\",\"ssh_key_names\":[\"<NEW-KEY-NAME>\"],\"file_system_names\":[],\"quantity\":1,\"name\":\"My Instance\"}'     ```  4. From your local terminal, establish an SSH connection to the instance.    Replace `<INSTANCE-IP>` with the public IP of the instance:      ```     ssh -i key.pem <INSTANCE-IP>     ```
    //
    //Future<AddSSHKey200Response> addSSHKey(AddSSHKeyRequest addSSHKeyRequest) async
    test('test addSSHKey', () async {
      // TODO
    });

    // Delete an SSH key
    //
    // Deletes the specified SSH key.
    //
    //Future<DeleteSSHKey200Response> deleteSSHKey(String id) async
    test('test deleteSSHKey', () async {
      // TODO
    });

    // List your SSH keys
    //
    // Retrieves a list of your SSH keys.
    //
    //Future<ListSSHKeys200Response> listSSHKeys() async
    test('test listSSHKeys', () async {
      // TODO
    });
  });
}
