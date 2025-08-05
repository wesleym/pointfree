# openapi.api.InstancesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://cloud.lambda.ai*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInstance**](InstancesApi.md#getinstance) | **GET** /api/v1/instances/{id} | Retrieve instance details
[**launchInstance**](InstancesApi.md#launchinstance) | **POST** /api/v1/instance-operations/launch | Launch instances
[**listInstanceTypes**](InstancesApi.md#listinstancetypes) | **GET** /api/v1/instance-types | List available instance types
[**listInstances**](InstancesApi.md#listinstances) | **GET** /api/v1/instances | List running instances
[**postInstance**](InstancesApi.md#postinstance) | **POST** /api/v1/instances/{id} | Update instance details
[**restartInstance**](InstancesApi.md#restartinstance) | **POST** /api/v1/instance-operations/restart | Restart instances
[**terminateInstance**](InstancesApi.md#terminateinstance) | **POST** /api/v1/instance-operations/terminate | Terminate instances


# **getInstance**
> GetInstance200Response getInstance(id)

Retrieve instance details

Retrieves the details of a specific instance, including whether or not the instance is running.

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

final api_instance = InstancesApi();
final id = 0920582c7ff041399e34823a0be62549; // String | The unique identifier (ID) of the instance

try {
    final result = api_instance.getInstance(id);
    print(result);
} catch (e) {
    print('Exception when calling InstancesApi->getInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique identifier (ID) of the instance | 

### Return type

[**GetInstance200Response**](GetInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **launchInstance**
> LaunchInstance200Response launchInstance(instanceLaunchRequest)

Launch instances

Launches a Lambda On-Demand Cloud instance.

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

final api_instance = InstancesApi();
final instanceLaunchRequest = InstanceLaunchRequest(); // InstanceLaunchRequest | 

try {
    final result = api_instance.launchInstance(instanceLaunchRequest);
    print(result);
} catch (e) {
    print('Exception when calling InstancesApi->launchInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instanceLaunchRequest** | [**InstanceLaunchRequest**](InstanceLaunchRequest.md)|  | 

### Return type

[**LaunchInstance200Response**](LaunchInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listInstanceTypes**
> ListInstanceTypes200Response listInstanceTypes()

List available instance types

Retrieves a list of the instance types currently offered on Lambda's public cloud, as well as details about each type. Details include resource specifications, pricing, and regional availability.

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

final api_instance = InstancesApi();

try {
    final result = api_instance.listInstanceTypes();
    print(result);
} catch (e) {
    print('Exception when calling InstancesApi->listInstanceTypes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListInstanceTypes200Response**](ListInstanceTypes200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listInstances**
> ListInstances200Response listInstances()

List running instances

Retrieves a list of your running instances.

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

final api_instance = InstancesApi();

try {
    final result = api_instance.listInstances();
    print(result);
} catch (e) {
    print('Exception when calling InstancesApi->listInstances: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListInstances200Response**](ListInstances200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postInstance**
> GetInstance200Response postInstance(id, instanceModificationRequest)

Update instance details

Updates the details of the specified instance.

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

final api_instance = InstancesApi();
final id = 0920582c7ff041399e34823a0be62549; // String | The unique identifier (ID) of the instance
final instanceModificationRequest = InstanceModificationRequest(); // InstanceModificationRequest | 

try {
    final result = api_instance.postInstance(id, instanceModificationRequest);
    print(result);
} catch (e) {
    print('Exception when calling InstancesApi->postInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique identifier (ID) of the instance | 
 **instanceModificationRequest** | [**InstanceModificationRequest**](InstanceModificationRequest.md)|  | 

### Return type

[**GetInstance200Response**](GetInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **restartInstance**
> RestartInstance200Response restartInstance(instanceRestartRequest)

Restart instances

Restarts one or more instances.

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

final api_instance = InstancesApi();
final instanceRestartRequest = InstanceRestartRequest(); // InstanceRestartRequest | 

try {
    final result = api_instance.restartInstance(instanceRestartRequest);
    print(result);
} catch (e) {
    print('Exception when calling InstancesApi->restartInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instanceRestartRequest** | [**InstanceRestartRequest**](InstanceRestartRequest.md)|  | 

### Return type

[**RestartInstance200Response**](RestartInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **terminateInstance**
> TerminateInstance200Response terminateInstance(instanceTerminateRequest)

Terminate instances

Terminates one or more instances.

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

final api_instance = InstancesApi();
final instanceTerminateRequest = InstanceTerminateRequest(); // InstanceTerminateRequest | 

try {
    final result = api_instance.terminateInstance(instanceTerminateRequest);
    print(result);
} catch (e) {
    print('Exception when calling InstancesApi->terminateInstance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instanceTerminateRequest** | [**InstanceTerminateRequest**](InstanceTerminateRequest.md)|  | 

### Return type

[**TerminateInstance200Response**](TerminateInstance200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

