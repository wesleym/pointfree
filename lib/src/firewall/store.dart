import 'package:openapi/api.dart';

// TODO: Define store-level types rather than reusing the generated API types. This would allow customizing stringers and equality.

abstract class FirewallStore {
  void add(FirewallRule firewallRules);
  void addAll(Iterable<FirewallRule> firewallRules);
  Iterable<FirewallRule> list();
  void clear();
}

class FirewallMemoryStore implements FirewallStore {
  static final instance = FirewallMemoryStore();

  final _firewallRules = <FirewallRule>[];

  @override
  List<FirewallRule> list() => _firewallRules;

  @override
  void add(FirewallRule firewallRule) => _firewallRules.add(firewallRule);

  @override
  void addAll(Iterable<FirewallRule> firewallRules) =>
      _firewallRules.addAll(firewallRules);

  @override
  void clear() => _firewallRules.clear();
}
