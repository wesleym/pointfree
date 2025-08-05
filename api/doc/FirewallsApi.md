# openapi.api.FirewallsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://cloud.lambda.ai*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFirewallRuleset**](FirewallsApi.md#createfirewallruleset) | **POST** /api/v1/firewall-rulesets | Create firewall ruleset
[**deleteFirewallRuleset**](FirewallsApi.md#deletefirewallruleset) | **DELETE** /api/v1/firewall-rulesets/{id} | Delete firewall ruleset
[**firewallRulesList**](FirewallsApi.md#firewallruleslist) | **GET** /api/v1/firewall-rules | List inbound firewall rules
[**firewallRulesSet**](FirewallsApi.md#firewallrulesset) | **PUT** /api/v1/firewall-rules | Replace inbound firewall rules
[**firewallRulesetsList**](FirewallsApi.md#firewallrulesetslist) | **GET** /api/v1/firewall-rulesets | List firewall rulesets
[**getFirewallRuleset**](FirewallsApi.md#getfirewallruleset) | **GET** /api/v1/firewall-rulesets/{id} | Retrieve firewall ruleset details
[**getGlobalFirewallRuleset**](FirewallsApi.md#getglobalfirewallruleset) | **GET** /api/v1/firewall-rulesets/global | Retrieve global firewall ruleset details
[**updateFirewallRuleset**](FirewallsApi.md#updatefirewallruleset) | **PATCH** /api/v1/firewall-rulesets/{id} | Update firewall ruleset
[**updateGlobalFirewallRuleset**](FirewallsApi.md#updateglobalfirewallruleset) | **PATCH** /api/v1/firewall-rulesets/global | Update global firewall ruleset


# **createFirewallRuleset**
> CreateFirewallRuleset200Response createFirewallRuleset(firewallRulesetCreateRequest)

Create firewall ruleset

Creates a new firewall ruleset with the specified name and rules.

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

final api_instance = FirewallsApi();
final firewallRulesetCreateRequest = FirewallRulesetCreateRequest(); // FirewallRulesetCreateRequest | 

try {
    final result = api_instance.createFirewallRuleset(firewallRulesetCreateRequest);
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->createFirewallRuleset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **firewallRulesetCreateRequest** | [**FirewallRulesetCreateRequest**](FirewallRulesetCreateRequest.md)|  | 

### Return type

[**CreateFirewallRuleset200Response**](CreateFirewallRuleset200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteFirewallRuleset**
> DeleteSSHKey200Response deleteFirewallRuleset(id)

Delete firewall ruleset

Deletes the firewall ruleset with the specified ID.

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

final api_instance = FirewallsApi();
final id = c4d291f47f9d436fa39f58493ce3b50d; // String | The unique identifier (ID) of the firewall ruleset

try {
    final result = api_instance.deleteFirewallRuleset(id);
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->deleteFirewallRuleset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique identifier (ID) of the firewall ruleset | 

### Return type

[**DeleteSSHKey200Response**](DeleteSSHKey200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **firewallRulesList**
> FirewallRulesList200Response firewallRulesList()

List inbound firewall rules

Retrieves a list of your firewall rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.

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

final api_instance = FirewallsApi();

try {
    final result = api_instance.firewallRulesList();
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->firewallRulesList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**FirewallRulesList200Response**](FirewallRulesList200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **firewallRulesSet**
> FirewallRulesList200Response firewallRulesSet(firewallRulesPutRequest)

Replace inbound firewall rules

Overwrites the inbound firewall rules currently active for your account's instances with the desired rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.

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

final api_instance = FirewallsApi();
final firewallRulesPutRequest = FirewallRulesPutRequest(); // FirewallRulesPutRequest | 

try {
    final result = api_instance.firewallRulesSet(firewallRulesPutRequest);
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->firewallRulesSet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **firewallRulesPutRequest** | [**FirewallRulesPutRequest**](FirewallRulesPutRequest.md)|  | 

### Return type

[**FirewallRulesList200Response**](FirewallRulesList200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **firewallRulesetsList**
> FirewallRulesetsList200Response firewallRulesetsList()

List firewall rulesets

Retrieves a list of your firewall rulesets.

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

final api_instance = FirewallsApi();

try {
    final result = api_instance.firewallRulesetsList();
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->firewallRulesetsList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**FirewallRulesetsList200Response**](FirewallRulesetsList200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFirewallRuleset**
> CreateFirewallRuleset200Response getFirewallRuleset(id)

Retrieve firewall ruleset details

Retrieves the details of a specific firewall ruleset.

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

final api_instance = FirewallsApi();
final id = c4d291f47f9d436fa39f58493ce3b50d; // String | The unique identifier (ID) of the firewall ruleset

try {
    final result = api_instance.getFirewallRuleset(id);
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->getFirewallRuleset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique identifier (ID) of the firewall ruleset | 

### Return type

[**CreateFirewallRuleset200Response**](CreateFirewallRuleset200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGlobalFirewallRuleset**
> GetGlobalFirewallRuleset200Response getGlobalFirewallRuleset()

Retrieve global firewall ruleset details

Retrieves the details of the global firewall ruleset.

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

final api_instance = FirewallsApi();

try {
    final result = api_instance.getGlobalFirewallRuleset();
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->getGlobalFirewallRuleset: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetGlobalFirewallRuleset200Response**](GetGlobalFirewallRuleset200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateFirewallRuleset**
> CreateFirewallRuleset200Response updateFirewallRuleset(id, firewallRulesetPatchRequest)

Update firewall ruleset

Updates a firewall ruleset. This is a partial update that allows updating either the name, rules, or both.

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

final api_instance = FirewallsApi();
final id = c4d291f47f9d436fa39f58493ce3b50d; // String | The unique identifier (ID) of the firewall ruleset
final firewallRulesetPatchRequest = FirewallRulesetPatchRequest(); // FirewallRulesetPatchRequest | 

try {
    final result = api_instance.updateFirewallRuleset(id, firewallRulesetPatchRequest);
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->updateFirewallRuleset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique identifier (ID) of the firewall ruleset | 
 **firewallRulesetPatchRequest** | [**FirewallRulesetPatchRequest**](FirewallRulesetPatchRequest.md)|  | 

### Return type

[**CreateFirewallRuleset200Response**](CreateFirewallRuleset200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGlobalFirewallRuleset**
> GetGlobalFirewallRuleset200Response updateGlobalFirewallRuleset(globalFirewallRulesetPatchRequest)

Update global firewall ruleset

Updates the global firewall ruleset. This allows updating the rules only.

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

final api_instance = FirewallsApi();
final globalFirewallRulesetPatchRequest = GlobalFirewallRulesetPatchRequest(); // GlobalFirewallRulesetPatchRequest | 

try {
    final result = api_instance.updateGlobalFirewallRuleset(globalFirewallRulesetPatchRequest);
    print(result);
} catch (e) {
    print('Exception when calling FirewallsApi->updateGlobalFirewallRuleset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **globalFirewallRulesetPatchRequest** | [**GlobalFirewallRulesetPatchRequest**](GlobalFirewallRulesetPatchRequest.md)|  | 

### Return type

[**GetGlobalFirewallRuleset200Response**](GetGlobalFirewallRuleset200Response.md)

### Authorization

[basicAuth](../README.md#basicAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

