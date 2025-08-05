//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';

/// tests for FirewallsApi
void main() {
  // final instance = FirewallsApi();

  group('tests for FirewallsApi', () {
    // Create firewall ruleset
    //
    // Creates a new firewall ruleset with the specified name and rules.
    //
    //Future<CreateFirewallRuleset200Response> createFirewallRuleset(FirewallRulesetCreateRequest firewallRulesetCreateRequest) async
    test('test createFirewallRuleset', () async {
      // TODO
    });

    // Delete firewall ruleset
    //
    // Deletes the firewall ruleset with the specified ID.
    //
    //Future<DeleteSSHKey200Response> deleteFirewallRuleset(String id) async
    test('test deleteFirewallRuleset', () async {
      // TODO
    });

    // List inbound firewall rules
    //
    // Retrieves a list of your firewall rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.
    //
    //Future<FirewallRulesList200Response> firewallRulesList() async
    test('test firewallRulesList', () async {
      // TODO
    });

    // Replace inbound firewall rules
    //
    // Overwrites the inbound firewall rules currently active for your account's instances with the desired rules.  **Note:** Firewall rules do not apply to the **us-south-1** region.
    //
    //Future<FirewallRulesList200Response> firewallRulesSet(FirewallRulesPutRequest firewallRulesPutRequest) async
    test('test firewallRulesSet', () async {
      // TODO
    });

    // List firewall rulesets
    //
    // Retrieves a list of your firewall rulesets.
    //
    //Future<FirewallRulesetsList200Response> firewallRulesetsList() async
    test('test firewallRulesetsList', () async {
      // TODO
    });

    // Retrieve firewall ruleset details
    //
    // Retrieves the details of a specific firewall ruleset.
    //
    //Future<CreateFirewallRuleset200Response> getFirewallRuleset(String id) async
    test('test getFirewallRuleset', () async {
      // TODO
    });

    // Retrieve global firewall ruleset details
    //
    // Retrieves the details of the global firewall ruleset.
    //
    //Future<GetGlobalFirewallRuleset200Response> getGlobalFirewallRuleset() async
    test('test getGlobalFirewallRuleset', () async {
      // TODO
    });

    // Update firewall ruleset
    //
    // Updates a firewall ruleset. This is a partial update that allows updating either the name, rules, or both.
    //
    //Future<CreateFirewallRuleset200Response> updateFirewallRuleset(String id, FirewallRulesetPatchRequest firewallRulesetPatchRequest) async
    test('test updateFirewallRuleset', () async {
      // TODO
    });

    // Update global firewall ruleset
    //
    // Updates the global firewall ruleset. This allows updating the rules only.
    //
    //Future<GetGlobalFirewallRuleset200Response> updateGlobalFirewallRuleset(GlobalFirewallRulesetPatchRequest globalFirewallRulesetPatchRequest) async
    test('test updateGlobalFirewallRuleset', () async {
      // TODO
    });
  });
}
