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

// tests for FirewallRule
void main() {
  // final instance = FirewallRule();

  group('test FirewallRule', () {
    // The protocol to which the rule applies.
    // NetworkProtocol protocol
    test('to test the property `protocol`', () async {
      // TODO
    });

    // An inclusive range of network ports specified as `[min, max]`. Not allowed for the `icmp` protocol but required for the others.  To specify a single port, list it twice (for example, `[22,22]`).
    // List<int> portRange (default value: const [])
    test('to test the property `portRange`', () async {
      // TODO
    });

    // The set of source IPv4 addresses from which you want to allow inbound traffic. These addresses must be specified in CIDR notation. You can specify individual public IPv4 CIDR blocks such as `1.2.3.4` or `1.2.3.4/32`, or you can specify `0.0.0.0/0` to allow access from any address.  This value is a string consisting of a public IPv4 address optionally followed by a slash (/) and an integer mask (the network prefix). If no mask is provided, the API assumes `/32` by default.
    // String sourceNetwork
    test('to test the property `sourceNetwork`', () async {
      // TODO
    });

    // A human-readable description of the rule.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });
  });
}
