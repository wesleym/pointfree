//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SSHKeysApi {
  SSHKeysApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add an SSH key
  ///
  ///  Add an SSH key to your Lambda Cloud account. You can upload an existing public key, or you can generate a new key pair.  -  To use an existing key pair, set the `public_key` property in the request body    to your public key.  -  To generate a new key pair, omit the `public_key` property from the request    body.  <div style=\"border: 0.075rem solid #E48603; border-radius: .2rem; font-size: 13px;   box-shadow: 0 0.2rem 0.5rem #0000000d,0 0 0.05rem #0000001a\">   <div style=\"background-color: #E486031a; padding: .4rem 2rem .4rem .6rem; font-weight: bold;\">Important</div>   <div style=\"background-color: transparent; padding: .4rem .6rem; line-height: 1.4;\">Lambda doesn't   store your private key after it's been generated. If you generate a new key pair, make sure to save   the resulting private key locally.</div> </div>  For example, to generate a new key pair and associate it with a Lambda On-Demand Cloud instance:  1. Generate the key pair. The command provided below automatically extracts and     saves the returned private key to a new file called `key.pem`. Replace     `<NEW-KEY-NAME>` with the name you want to assign to the SSH key:      ```     curl https://cloud.lambda.ai/api/v1/ssh-keys \\     --fail \\     -u ${LAMBDA_API_KEY}: \\     -X POST \\     -d '{\"name\": \"<NEW-KEY-NAME>\"}' \\     | jq -r '.data.private_key' > key.pem     ```  2. Next, set the private key's permissions to read-only:      ```     chmod 400 key.pem     ```  3. Launch a new instance. Replace `<NEW-KEY-NAME>` with the name you assigned    to your SSH key.      ```     curl -X POST \"https://cloud.lambda.ai/api/v1/instance-operations/launch\" \\     --fail \\     -u ${LAMBDA_API_KEY}: \\     -X POST \\     -d '{\"region_name\":\"us-west-1\",\"instance_type_name\":\"gpu_1x_a10\",\"ssh_key_names\":[\"<NEW-KEY-NAME>\"],\"file_system_names\":[],\"quantity\":1,\"name\":\"My Instance\"}'     ```  4. From your local terminal, establish an SSH connection to the instance.    Replace `<INSTANCE-IP>` with the public IP of the instance:      ```     ssh -i key.pem <INSTANCE-IP>     ```
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AddSSHKeyRequest] addSSHKeyRequest (required):
  Future<Response> addSSHKeyWithHttpInfo(
    AddSSHKeyRequest addSSHKeyRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/ssh-keys';

    // ignore: prefer_final_locals
    Object? postBody = addSSHKeyRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Add an SSH key
  ///
  ///  Add an SSH key to your Lambda Cloud account. You can upload an existing public key, or you can generate a new key pair.  -  To use an existing key pair, set the `public_key` property in the request body    to your public key.  -  To generate a new key pair, omit the `public_key` property from the request    body.  <div style=\"border: 0.075rem solid #E48603; border-radius: .2rem; font-size: 13px;   box-shadow: 0 0.2rem 0.5rem #0000000d,0 0 0.05rem #0000001a\">   <div style=\"background-color: #E486031a; padding: .4rem 2rem .4rem .6rem; font-weight: bold;\">Important</div>   <div style=\"background-color: transparent; padding: .4rem .6rem; line-height: 1.4;\">Lambda doesn't   store your private key after it's been generated. If you generate a new key pair, make sure to save   the resulting private key locally.</div> </div>  For example, to generate a new key pair and associate it with a Lambda On-Demand Cloud instance:  1. Generate the key pair. The command provided below automatically extracts and     saves the returned private key to a new file called `key.pem`. Replace     `<NEW-KEY-NAME>` with the name you want to assign to the SSH key:      ```     curl https://cloud.lambda.ai/api/v1/ssh-keys \\     --fail \\     -u ${LAMBDA_API_KEY}: \\     -X POST \\     -d '{\"name\": \"<NEW-KEY-NAME>\"}' \\     | jq -r '.data.private_key' > key.pem     ```  2. Next, set the private key's permissions to read-only:      ```     chmod 400 key.pem     ```  3. Launch a new instance. Replace `<NEW-KEY-NAME>` with the name you assigned    to your SSH key.      ```     curl -X POST \"https://cloud.lambda.ai/api/v1/instance-operations/launch\" \\     --fail \\     -u ${LAMBDA_API_KEY}: \\     -X POST \\     -d '{\"region_name\":\"us-west-1\",\"instance_type_name\":\"gpu_1x_a10\",\"ssh_key_names\":[\"<NEW-KEY-NAME>\"],\"file_system_names\":[],\"quantity\":1,\"name\":\"My Instance\"}'     ```  4. From your local terminal, establish an SSH connection to the instance.    Replace `<INSTANCE-IP>` with the public IP of the instance:      ```     ssh -i key.pem <INSTANCE-IP>     ```
  ///
  /// Parameters:
  ///
  /// * [AddSSHKeyRequest] addSSHKeyRequest (required):
  Future<AddSSHKey200Response?> addSSHKey(
    AddSSHKeyRequest addSSHKeyRequest,
  ) async {
    final response = await addSSHKeyWithHttpInfo(
      addSSHKeyRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'AddSSHKey200Response',
      ) as AddSSHKey200Response;
    }
    return null;
  }

  /// Delete an SSH key
  ///
  /// Deletes the specified SSH key.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the SSH key to delete
  Future<Response> deleteSSHKeyWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/ssh-keys/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete an SSH key
  ///
  /// Deletes the specified SSH key.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the SSH key to delete
  Future<DeleteSSHKey200Response?> deleteSSHKey(
    String id,
  ) async {
    final response = await deleteSSHKeyWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'DeleteSSHKey200Response',
      ) as DeleteSSHKey200Response;
    }
    return null;
  }

  /// List your SSH keys
  ///
  /// Retrieves a list of your SSH keys.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> listSSHKeysWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/ssh-keys';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List your SSH keys
  ///
  /// Retrieves a list of your SSH keys.
  Future<ListSSHKeys200Response?> listSSHKeys() async {
    final response = await listSSHKeysWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'ListSSHKeys200Response',
      ) as ListSSHKeys200Response;
    }
    return null;
  }
}
