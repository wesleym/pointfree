//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FirewallsApi {
  FirewallsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// List inbound firewall rules
  ///
  /// Retrieves a list of your firewall rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.
  ///
  /// Note: This method returns the HTTP [http.Response].
  Future<http.Response> firewallRulesListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rules';

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

  /// List inbound firewall rules
  ///
  /// Retrieves a list of your firewall rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.
  Future<FirewallRulesList200Response?> firewallRulesList() async {
    final response = await firewallRulesListWithHttpInfo();
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
        'FirewallRulesList200Response',
      ) as FirewallRulesList200Response;
    }
    return null;
  }

  /// Replace inbound firewall rules
  ///
  /// Overwrites the inbound firewall rules currently active for your account's instances with the desired rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.
  ///
  /// Note: This method returns the HTTP [http.Response].
  ///
  /// Parameters:
  ///
  /// * [FirewallRulesPutRequest] firewallRulesPutRequest (required):
  Future<http.Response> firewallRulesSetWithHttpInfo(
    FirewallRulesPutRequest firewallRulesPutRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rules';

    // ignore: prefer_final_locals
    Object? postBody = firewallRulesPutRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Replace inbound firewall rules
  ///
  /// Overwrites the inbound firewall rules currently active for your account's instances with the desired rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.
  ///
  /// Parameters:
  ///
  /// * [FirewallRulesPutRequest] firewallRulesPutRequest (required):
  Future<FirewallRulesList200Response?> firewallRulesSet(
    FirewallRulesPutRequest firewallRulesPutRequest,
  ) async {
    final response = await firewallRulesSetWithHttpInfo(
      firewallRulesPutRequest,
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
        'FirewallRulesList200Response',
      ) as FirewallRulesList200Response;
    }
    return null;
  }
}
