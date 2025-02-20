# openapi.api.FilesystemsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://cloud.lambdalabs.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFilesystem**](FilesystemsApi.md#createfilesystem) | **POST** /api/v1/filesystems | Create filesystem
[**filesystemDelete**](FilesystemsApi.md#filesystemdelete) | **DELETE** /api/v1/filesystems/{id} | Delete filesystem
[**listFilesystems**](FilesystemsApi.md#listfilesystems) | **GET** /api/v1/file-systems | List filesystems


# **createFilesystem**
> CreateFilesystem200Response createFilesystem(filesystemCreateRequest)

Create filesystem

Creates a new filesystem.

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

final api_instance = FilesystemsApi();
final filesystemCreateRequest = FilesystemCreateRequest(); // FilesystemCreateRequest | 

try {
    final result = api_instance.createFilesystem(filesystemCreateRequest);
    print(result);
} catch (e) {
    print('Exception when calling FilesystemsApi->createFilesystem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filesystemCreateRequest** | [**FilesystemCreateRequest**](FilesystemCreateRequest.md)|  | 

### Return type

[**CreateFilesystem200Response**](CreateFilesystem200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **filesystemDelete**
> FilesystemDelete200Response filesystemDelete(id)

Delete filesystem

Deletes the filesystem with the specified ID. The filesystem must not be attached to any running instances at the time of deletion.

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

final api_instance = FilesystemsApi();
final id = id_example; // String | 

try {
    final result = api_instance.filesystemDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling FilesystemsApi->filesystemDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**FilesystemDelete200Response**](FilesystemDelete200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listFilesystems**
> ListFilesystems200Response listFilesystems()

List filesystems

Retrieves a list of your filesystems.

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

final api_instance = FilesystemsApi();

try {
    final result = api_instance.listFilesystems();
    print(result);
} catch (e) {
    print('Exception when calling FilesystemsApi->listFilesystems: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListFilesystems200Response**](ListFilesystems200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

