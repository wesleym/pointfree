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

  /// Create firewall ruleset
  ///
  /// Creates a new firewall ruleset with the specified name and rules.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [FirewallRulesetCreateRequest] firewallRulesetCreateRequest (required):
  Future<Response> createFirewallRulesetWithHttpInfo(
    FirewallRulesetCreateRequest firewallRulesetCreateRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rulesets';

    // ignore: prefer_final_locals
    Object? postBody = firewallRulesetCreateRequest;

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

  /// Create firewall ruleset
  ///
  /// Creates a new firewall ruleset with the specified name and rules.
  ///
  /// Parameters:
  ///
  /// * [FirewallRulesetCreateRequest] firewallRulesetCreateRequest (required):
  Future<CreateFirewallRuleset200Response?> createFirewallRuleset(
    FirewallRulesetCreateRequest firewallRulesetCreateRequest,
  ) async {
    final response = await createFirewallRulesetWithHttpInfo(
      firewallRulesetCreateRequest,
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
        'CreateFirewallRuleset200Response',
      ) as CreateFirewallRuleset200Response;
    }
    return null;
  }

  /// Delete firewall ruleset
  ///
  /// Deletes the firewall ruleset with the specified ID.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the firewall ruleset
  Future<Response> deleteFirewallRulesetWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rulesets/{id}'.replaceAll('{id}', id);

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

  /// Delete firewall ruleset
  ///
  /// Deletes the firewall ruleset with the specified ID.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the firewall ruleset
  Future<DeleteSSHKey200Response?> deleteFirewallRuleset(
    String id,
  ) async {
    final response = await deleteFirewallRulesetWithHttpInfo(
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

  /// List inbound firewall rules
  ///
  /// Retrieves a list of your firewall rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> firewallRulesListWithHttpInfo() async {
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
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [FirewallRulesPutRequest] firewallRulesPutRequest (required):
  Future<Response> firewallRulesSetWithHttpInfo(
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

  /// List firewall rulesets
  ///
  /// Retrieves a list of your firewall rulesets.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> firewallRulesetsListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rulesets';

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

  /// List firewall rulesets
  ///
  /// Retrieves a list of your firewall rulesets.
  Future<FirewallRulesetsList200Response?> firewallRulesetsList() async {
    final response = await firewallRulesetsListWithHttpInfo();
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
        'FirewallRulesetsList200Response',
      ) as FirewallRulesetsList200Response;
    }
    return null;
  }

  /// Retrieve firewall ruleset details
  ///
  /// Retrieves the details of a specific firewall ruleset.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the firewall ruleset
  Future<Response> getFirewallRulesetWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rulesets/{id}'.replaceAll('{id}', id);

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

  /// Retrieve firewall ruleset details
  ///
  /// Retrieves the details of a specific firewall ruleset.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the firewall ruleset
  Future<CreateFirewallRuleset200Response?> getFirewallRuleset(
    String id,
  ) async {
    final response = await getFirewallRulesetWithHttpInfo(
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
        'CreateFirewallRuleset200Response',
      ) as CreateFirewallRuleset200Response;
    }
    return null;
  }

  /// Retrieve global firewall ruleset details
  ///
  /// Retrieves the details of the global firewall ruleset.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getGlobalFirewallRulesetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rulesets/global';

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

  /// Retrieve global firewall ruleset details
  ///
  /// Retrieves the details of the global firewall ruleset.
  Future<GetGlobalFirewallRuleset200Response?>
      getGlobalFirewallRuleset() async {
    final response = await getGlobalFirewallRulesetWithHttpInfo();
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
        'GetGlobalFirewallRuleset200Response',
      ) as GetGlobalFirewallRuleset200Response;
    }
    return null;
  }

  /// Update firewall ruleset
  ///
  /// Updates a firewall ruleset. This is a partial update that allows updating either the name, rules, or both.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the firewall ruleset
  ///
  /// * [FirewallRulesetPatchRequest] firewallRulesetPatchRequest (required):
  Future<Response> updateFirewallRulesetWithHttpInfo(
    String id,
    FirewallRulesetPatchRequest firewallRulesetPatchRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rulesets/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = firewallRulesetPatchRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update firewall ruleset
  ///
  /// Updates a firewall ruleset. This is a partial update that allows updating either the name, rules, or both.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the firewall ruleset
  ///
  /// * [FirewallRulesetPatchRequest] firewallRulesetPatchRequest (required):
  Future<CreateFirewallRuleset200Response?> updateFirewallRuleset(
    String id,
    FirewallRulesetPatchRequest firewallRulesetPatchRequest,
  ) async {
    final response = await updateFirewallRulesetWithHttpInfo(
      id,
      firewallRulesetPatchRequest,
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
        'CreateFirewallRuleset200Response',
      ) as CreateFirewallRuleset200Response;
    }
    return null;
  }

  /// Update global firewall ruleset
  ///
  /// Updates the global firewall ruleset. This allows updating the rules only.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [GlobalFirewallRulesetPatchRequest] globalFirewallRulesetPatchRequest (required):
  Future<Response> updateGlobalFirewallRulesetWithHttpInfo(
    GlobalFirewallRulesetPatchRequest globalFirewallRulesetPatchRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/firewall-rulesets/global';

    // ignore: prefer_final_locals
    Object? postBody = globalFirewallRulesetPatchRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update global firewall ruleset
  ///
  /// Updates the global firewall ruleset. This allows updating the rules only.
  ///
  /// Parameters:
  ///
  /// * [GlobalFirewallRulesetPatchRequest] globalFirewallRulesetPatchRequest (required):
  Future<GetGlobalFirewallRuleset200Response?> updateGlobalFirewallRuleset(
    GlobalFirewallRulesetPatchRequest globalFirewallRulesetPatchRequest,
  ) async {
    final response = await updateGlobalFirewallRulesetWithHttpInfo(
      globalFirewallRulesetPatchRequest,
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
        'GetGlobalFirewallRuleset200Response',
      ) as GetGlobalFirewallRuleset200Response;
    }
    return null;
  }
}
