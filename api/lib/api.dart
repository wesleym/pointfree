//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/default_api.dart';

part 'model/add_ssh_key200_response.dart';
part 'model/add_ssh_key_request.dart';
part 'model/error.dart';
part 'model/error_code.dart';
part 'model/error_response_body.dart';
part 'model/file_system.dart';
part 'model/get_instance200_response.dart';
part 'model/instance.dart';
part 'model/instance_type.dart';
part 'model/instance_type_specs.dart';
part 'model/instance_types200_response.dart';
part 'model/instance_types200_response_data_value.dart';
part 'model/launch_instance200_response.dart';
part 'model/launch_instance200_response_data.dart';
part 'model/launch_instance_request.dart';
part 'model/list_file_systems200_response.dart';
part 'model/list_instances200_response.dart';
part 'model/list_ssh_keys200_response.dart';
part 'model/region.dart';
part 'model/restart_instance200_response.dart';
part 'model/restart_instance200_response_data.dart';
part 'model/restart_instance_request.dart';
part 'model/ssh_key.dart';
part 'model/terminate_instance200_response.dart';
part 'model/terminate_instance200_response_data.dart';
part 'model/terminate_instance_request.dart';
part 'model/user.dart';

/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) =>
    pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
