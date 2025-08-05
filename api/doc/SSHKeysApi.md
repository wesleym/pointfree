# openapi.api.SSHKeysApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://cloud.lambda.ai*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addSSHKey**](SSHKeysApi.md#addsshkey) | **POST** /api/v1/ssh-keys | Add an SSH key
[**deleteSSHKey**](SSHKeysApi.md#deletesshkey) | **DELETE** /api/v1/ssh-keys/{id} | Delete an SSH key
[**listSSHKeys**](SSHKeysApi.md#listsshkeys) | **GET** /api/v1/ssh-keys | List your SSH keys


# **addSSHKey**
> AddSSHKey200Response addSSHKey(addSSHKeyRequest)

Add an SSH key

 Add an SSH key to your Lambda Cloud account. You can upload an existing public key, or you can generate a new key pair.  -  To use an existing key pair, set the `public_key` property in the request body    to your public key.  -  To generate a new key pair, omit the `public_key` property from the request    body.  <div style=\"border: 0.075rem solid #E48603; border-radius: .2rem; font-size: 13px;   box-shadow: 0 0.2rem 0.5rem #0000000d,0 0 0.05rem #0000001a\">   <div style=\"background-color: #E486031a; padding: .4rem 2rem .4rem .6rem; font-weight: bold;\">Important</div>   <div style=\"background-color: transparent; padding: .4rem .6rem; line-height: 1.4;\">Lambda doesn't   store your private key after it's been generated. If you generate a new key pair, make sure to save   the resulting private key locally.</div> </div>  For example, to generate a new key pair and associate it with a Lambda On-Demand Cloud instance:  1. Generate the key pair. The command provided below automatically extracts and     saves the returned private key to a new file called `key.pem`. Replace     `<NEW-KEY-NAME>` with the name you want to assign to the SSH key:      ```     curl https://cloud.lambda.ai/api/v1/ssh-keys \\     --fail \\     -u ${LAMBDA_API_KEY}: \\     -X POST \\     -d '{\"name\": \"<NEW-KEY-NAME>\"}' \\     | jq -r '.data.private_key' > key.pem     ```  2. Next, set the private key's permissions to read-only:      ```     chmod 400 key.pem     ```  3. Launch a new instance. Replace `<NEW-KEY-NAME>` with the name you assigned    to your SSH key.      ```     curl -X POST \"https://cloud.lambda.ai/api/v1/instance-operations/launch\" \\     --fail \\     -u ${LAMBDA_API_KEY}: \\     -X POST \\     -d '{\"region_name\":\"us-west-1\",\"instance_type_name\":\"gpu_1x_a10\",\"ssh_key_names\":[\"<NEW-KEY-NAME>\"],\"file_system_names\":[],\"quantity\":1,\"name\":\"My Instance\"}'     ```  4. From your local terminal, establish an SSH connection to the instance.    Replace `<INSTANCE-IP>` with the public IP of the instance:      ```     ssh -i key.pem <INSTANCE-IP>     ``` 

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SSHKeysApi();
final addSSHKeyRequest = AddSSHKeyRequest(); // AddSSHKeyRequest | 

try {
    final result = api_instance.addSSHKey(addSSHKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling SSHKeysApi->addSSHKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addSSHKeyRequest** | [**AddSSHKeyRequest**](AddSSHKeyRequest.md)|  | 

### Return type

[**AddSSHKey200Response**](AddSSHKey200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSSHKey**
> DeleteSSHKey200Response deleteSSHKey(id)

Delete an SSH key

Deletes the specified SSH key.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SSHKeysApi();
final id = ddf9a910ceb744a0bb95242cbba6cb50; // String | The unique identifier (ID) of the SSH key to delete

try {
    final result = api_instance.deleteSSHKey(id);
    print(result);
} catch (e) {
    print('Exception when calling SSHKeysApi->deleteSSHKey: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique identifier (ID) of the SSH key to delete | 

### Return type

[**DeleteSSHKey200Response**](DeleteSSHKey200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSSHKeys**
> ListSSHKeys200Response listSSHKeys()

List your SSH keys

Retrieves a list of your SSH keys.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SSHKeysApi();

try {
    final result = api_instance.listSSHKeys();
    print(result);
} catch (e) {
    print('Exception when calling SSHKeysApi->listSSHKeys: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListSSHKeys200Response**](ListSSHKeys200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

