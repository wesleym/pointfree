//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilesystemsApi {
  FilesystemsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create filesystem
  ///
  /// Creates a new filesystem.
  ///
  /// Note: This method returns the HTTP [http.Response].
  ///
  /// Parameters:
  ///
  /// * [FilesystemCreateRequest] filesystemCreateRequest (required):
  Future<http.Response> createFilesystemWithHttpInfo(
    FilesystemCreateRequest filesystemCreateRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/filesystems';

    // ignore: prefer_final_locals
    Object? postBody = filesystemCreateRequest;

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

  /// Create filesystem
  ///
  /// Creates a new filesystem.
  ///
  /// Parameters:
  ///
  /// * [FilesystemCreateRequest] filesystemCreateRequest (required):
  Future<CreateFilesystem200Response?> createFilesystem(
    FilesystemCreateRequest filesystemCreateRequest,
  ) async {
    final response = await createFilesystemWithHttpInfo(
      filesystemCreateRequest,
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
        'CreateFilesystem200Response',
      ) as CreateFilesystem200Response;
    }
    return null;
  }

  /// Delete filesystem
  ///
  /// Deletes the filesystem with the specified ID. The filesystem must not be attached to any running instances at the time of deletion.
  ///
  /// Note: This method returns the HTTP [http.Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<http.Response> filesystemDeleteWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/filesystems/{id}'.replaceAll('{id}', id);

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

  /// Delete filesystem
  ///
  /// Deletes the filesystem with the specified ID. The filesystem must not be attached to any running instances at the time of deletion.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<FilesystemDelete200Response?> filesystemDelete(
    String id,
  ) async {
    final response = await filesystemDeleteWithHttpInfo(
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
        'FilesystemDelete200Response',
      ) as FilesystemDelete200Response;
    }
    return null;
  }

  /// List filesystems
  ///
  /// Retrieves a list of your filesystems.
  ///
  /// Note: This method returns the HTTP [http.Response].
  Future<http.Response> listFilesystemsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/file-systems';

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

  /// List filesystems
  ///
  /// Retrieves a list of your filesystems.
  Future<ListFilesystems200Response?> listFilesystems() async {
    final response = await listFilesystemsWithHttpInfo();
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
        'ListFilesystems200Response',
      ) as ListFilesystems200Response;
    }
    return null;
  }
}
