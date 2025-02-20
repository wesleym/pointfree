//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InstancesApi {
  InstancesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Retrieve instance details
  ///
  /// Retrieves the details of a specific instance, including whether or not the instance is running.
  ///
  /// Note: This method returns the HTTP [http.Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the instance
  Future<http.Response> getInstanceWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/instances/{id}'.replaceAll('{id}', id);

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

  /// Retrieve instance details
  ///
  /// Retrieves the details of a specific instance, including whether or not the instance is running.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the instance
  Future<GetInstance200Response?> getInstance(
    String id,
  ) async {
    final response = await getInstanceWithHttpInfo(
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
        'GetInstance200Response',
      ) as GetInstance200Response;
    }
    return null;
  }

  /// Launch instances
  ///
  /// Launches a Lambda On-Demand Cloud instance.
  ///
  /// Note: This method returns the HTTP [http.Response].
  ///
  /// Parameters:
  ///
  /// * [InstanceLaunchRequest] instanceLaunchRequest (required):
  Future<http.Response> launchInstanceWithHttpInfo(
    InstanceLaunchRequest instanceLaunchRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/instance-operations/launch';

    // ignore: prefer_final_locals
    Object? postBody = instanceLaunchRequest;

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

  /// Launch instances
  ///
  /// Launches a Lambda On-Demand Cloud instance.
  ///
  /// Parameters:
  ///
  /// * [InstanceLaunchRequest] instanceLaunchRequest (required):
  Future<LaunchInstance200Response?> launchInstance(
    InstanceLaunchRequest instanceLaunchRequest,
  ) async {
    final response = await launchInstanceWithHttpInfo(
      instanceLaunchRequest,
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
        'LaunchInstance200Response',
      ) as LaunchInstance200Response;
    }
    return null;
  }

  /// List running instances
  ///
  /// Retrieves a list of your running instances.
  ///
  /// Note: This method returns the HTTP [http.Response].
  Future<http.Response> listInstancesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/instances';

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

  /// List running instances
  ///
  /// Retrieves a list of your running instances.
  Future<ListInstances200Response?> listInstances() async {
    final response = await listInstancesWithHttpInfo();
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
        'ListInstances200Response',
      ) as ListInstances200Response;
    }
    return null;
  }

  /// Update instance details
  ///
  /// Updates the details of the specified instance.
  ///
  /// Note: This method returns the HTTP [http.Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the instance
  ///
  /// * [InstanceModificationRequest] instanceModificationRequest (required):
  Future<http.Response> postInstanceWithHttpInfo(
    String id,
    InstanceModificationRequest instanceModificationRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/instances/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = instanceModificationRequest;

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

  /// Update instance details
  ///
  /// Updates the details of the specified instance.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The unique identifier (ID) of the instance
  ///
  /// * [InstanceModificationRequest] instanceModificationRequest (required):
  Future<GetInstance200Response?> postInstance(
    String id,
    InstanceModificationRequest instanceModificationRequest,
  ) async {
    final response = await postInstanceWithHttpInfo(
      id,
      instanceModificationRequest,
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
        'GetInstance200Response',
      ) as GetInstance200Response;
    }
    return null;
  }

  /// Restart instances
  ///
  /// Restarts one or more instances.
  ///
  /// Note: This method returns the HTTP [http.Response].
  ///
  /// Parameters:
  ///
  /// * [InstanceRestartRequest] instanceRestartRequest (required):
  Future<http.Response> restartInstanceWithHttpInfo(
    InstanceRestartRequest instanceRestartRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/instance-operations/restart';

    // ignore: prefer_final_locals
    Object? postBody = instanceRestartRequest;

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

  /// Restart instances
  ///
  /// Restarts one or more instances.
  ///
  /// Parameters:
  ///
  /// * [InstanceRestartRequest] instanceRestartRequest (required):
  Future<RestartInstance200Response?> restartInstance(
    InstanceRestartRequest instanceRestartRequest,
  ) async {
    final response = await restartInstanceWithHttpInfo(
      instanceRestartRequest,
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
        'RestartInstance200Response',
      ) as RestartInstance200Response;
    }
    return null;
  }

  /// List available instance types
  ///
  /// Retrieves a list of the instance types currently offered on Lambda's public cloud, as well as details about each type. Details include resource specifications, pricing, and regional availability.
  ///
  /// Note: This method returns the HTTP [http.Response].
  Future<http.Response>
      svrExternalApiV1EndpointsInstanceTypesGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/instance-types';

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

  /// List available instance types
  ///
  /// Retrieves a list of the instance types currently offered on Lambda's public cloud, as well as details about each type. Details include resource specifications, pricing, and regional availability.
  Future<SvrExternalApiV1EndpointsInstanceTypesGet200Response?>
      svrExternalApiV1EndpointsInstanceTypesGet() async {
    final response =
        await svrExternalApiV1EndpointsInstanceTypesGetWithHttpInfo();
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
        'SvrExternalApiV1EndpointsInstanceTypesGet200Response',
      ) as SvrExternalApiV1EndpointsInstanceTypesGet200Response;
    }
    return null;
  }

  /// Terminate instances
  ///
  /// Terminates one or more instances.
  ///
  /// Note: This method returns the HTTP [http.Response].
  ///
  /// Parameters:
  ///
  /// * [InstanceTerminateRequest] instanceTerminateRequest (required):
  Future<http.Response> terminateInstanceWithHttpInfo(
    InstanceTerminateRequest instanceTerminateRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/instance-operations/terminate';

    // ignore: prefer_final_locals
    Object? postBody = instanceTerminateRequest;

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

  /// Terminate instances
  ///
  /// Terminates one or more instances.
  ///
  /// Parameters:
  ///
  /// * [InstanceTerminateRequest] instanceTerminateRequest (required):
  Future<TerminateInstance200Response?> terminateInstance(
    InstanceTerminateRequest instanceTerminateRequest,
  ) async {
    final response = await terminateInstanceWithHttpInfo(
      instanceTerminateRequest,
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
        'TerminateInstance200Response',
      ) as TerminateInstance200Response;
    }
    return null;
  }
}
