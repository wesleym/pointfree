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

part 'api/filesystems_api.dart';
part 'api/firewalls_api.dart';
part 'api/images_api.dart';
part 'api/instances_api.dart';
part 'api/ssh_keys_api.dart';

part 'model/add_ssh_key200_response.dart';
part 'model/add_ssh_key200_response_data.dart';
part 'model/add_ssh_key_request.dart';
part 'model/api_error_account_inactive.dart';
part 'model/api_error_duplicate.dart';
part 'model/api_error_file_system_in_wrong_region.dart';
part 'model/api_error_filesystem_in_use.dart';
part 'model/api_error_filesystem_not_found.dart';
part 'model/api_error_firewall_ruleset_in_use.dart';
part 'model/api_error_firewall_ruleset_not_found.dart';
part 'model/api_error_instance_not_found.dart';
part 'model/api_error_insufficient_capacity.dart';
part 'model/api_error_internal.dart';
part 'model/api_error_invalid_billing_address.dart';
part 'model/api_error_invalid_parameters.dart';
part 'model/api_error_launch_resource_not_found.dart';
part 'model/api_error_quota_exceeded.dart';
part 'model/api_error_unauthorized.dart';
part 'model/create_filesystem200_response.dart';
part 'model/create_filesystem400_response.dart';
part 'model/create_filesystem400_response_error.dart';
part 'model/create_firewall_ruleset200_response.dart';
part 'model/create_firewall_ruleset400_response.dart';
part 'model/create_firewall_ruleset400_response_error.dart';
part 'model/create_firewall_ruleset409_response.dart';
part 'model/delete_firewall_ruleset400_response.dart';
part 'model/delete_ssh_key200_response.dart';
part 'model/filesystem.dart';
part 'model/filesystem_create_request.dart';
part 'model/filesystem_delete200_response.dart';
part 'model/filesystem_delete400_response.dart';
part 'model/filesystem_delete404_response.dart';
part 'model/filesystem_delete_response.dart';
part 'model/filesystem_mount_entry.dart';
part 'model/firewall_rule.dart';
part 'model/firewall_rules_list200_response.dart';
part 'model/firewall_rules_put_request.dart';
part 'model/firewall_ruleset.dart';
part 'model/firewall_ruleset_create_request.dart';
part 'model/firewall_ruleset_entry.dart';
part 'model/firewall_ruleset_patch_request.dart';
part 'model/firewall_rulesets_list200_response.dart';
part 'model/generated_ssh_key.dart';
part 'model/get_firewall_ruleset404_response.dart';
part 'model/get_global_firewall_ruleset200_response.dart';
part 'model/get_instance200_response.dart';
part 'model/get_instance401_response.dart';
part 'model/get_instance404_response.dart';
part 'model/global_firewall_ruleset.dart';
part 'model/global_firewall_ruleset_patch_request.dart';
part 'model/image.dart';
part 'model/image_architecture.dart';
part 'model/image_specification_family.dart';
part 'model/image_specification_id.dart';
part 'model/instance.dart';
part 'model/instance_action_availability.dart';
part 'model/instance_action_availability_details.dart';
part 'model/instance_action_availability_details_reason_code.dart';
part 'model/instance_action_unavailable_code.dart';
part 'model/instance_launch_request.dart';
part 'model/instance_launch_request_image.dart';
part 'model/instance_launch_response.dart';
part 'model/instance_modification_request.dart';
part 'model/instance_restart_request.dart';
part 'model/instance_restart_response.dart';
part 'model/instance_status.dart';
part 'model/instance_terminate_request.dart';
part 'model/instance_terminate_response.dart';
part 'model/instance_type.dart';
part 'model/instance_type_specs.dart';
part 'model/instance_types_item.dart';
part 'model/launch_instance200_response.dart';
part 'model/launch_instance400_response.dart';
part 'model/launch_instance400_response_error.dart';
part 'model/launch_instance403_response.dart';
part 'model/launch_instance403_response_error.dart';
part 'model/launch_instance404_response.dart';
part 'model/list_filesystems200_response.dart';
part 'model/list_images200_response.dart';
part 'model/list_instance_types200_response.dart';
part 'model/list_instances200_response.dart';
part 'model/list_instances401_response.dart';
part 'model/list_instances403_response.dart';
part 'model/list_ssh_keys200_response.dart';
part 'model/network_protocol.dart';
part 'model/post_instance400_response.dart';
part 'model/public_region_code.dart';
part 'model/region.dart';
part 'model/requested_filesystem_mount_entry.dart';
part 'model/requested_tag_entry.dart';
part 'model/restart_instance200_response.dart';
part 'model/ssh_key.dart';
part 'model/tag_entry.dart';
part 'model/terminate_instance200_response.dart';
part 'model/user.dart';
part 'model/user_status.dart';

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
