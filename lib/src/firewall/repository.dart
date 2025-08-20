import 'dart:async';
import 'dart:developer';

import 'package:pointfree/src/firewall/store.dart';
import 'package:lambda_cloud_dart_sdk/lambda_cloud_dart_sdk.dart';
import 'package:pointfree/src/login/store.dart';

const _ttl = Duration(minutes: 5);

class FirewallRepository {
  static final instance = FirewallRepository();

  final _store = FirewallMemoryStore.instance;
  var _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
  List<FirewallRule> get firewallRules => _store.list();
  final _controller = StreamController<List<FirewallRule>>.broadcast();
  Stream<List<FirewallRule>> get stream => _controller.stream;

  Future<void> update({bool force = false}) async {
    var now = DateTime.now();
    if (!force && _lastFetchTime.add(_ttl).isAfter(now)) return;

    await LoginStore.instance.waitForReady();

    final FirewallRulesList200Response firewallRules;
    try {
      final maybeFirewallRules = await FirewallsApi(
        defaultApiClient,
      ).firewallRulesList();
      // This should never be null: an ApiException should have been thrown instead.
      firewallRules = maybeFirewallRules!;
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to list firewall rules: ${e.message}');
      return;
    }

    _store
      ..clear()
      ..addAll(firewallRules.data);
    _controller.add(_store.list());
    _lastFetchTime = now;
  }

  Future<void> replace(List<FirewallRule> firewallRules) async {
    await LoginStore.instance.waitForReady();

    try {
      await FirewallsApi(
        defaultApiClient,
      ).firewallRulesSet(FirewallRulesPutRequest(data: firewallRules));
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to update firewall rules: ${e.message}');
      return;
    }

    // TODO: Optimistic update.
    await update(force: true);
  }
}
