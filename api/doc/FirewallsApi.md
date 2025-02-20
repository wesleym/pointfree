# openapi.api.FirewallsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://cloud.lambdalabs.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**firewallRulesList**](FirewallsApi.md#firewallruleslist) | **GET** /api/v1/firewall-rules | List inbound firewall rules
[**firewallRulesSet**](FirewallsApi.md#firewallrulesset) | **PUT** /api/v1/firewall-rules | Replace inbound firewall rules


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

