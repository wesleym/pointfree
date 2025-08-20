import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/firewall/repository.dart';
import 'package:pointfree/src/firewall/create_cupertino.dart';
import 'package:pointfree/src/firewall/create_material.dart';
import 'package:pointfree/src/theme_type_provider.dart';
import 'package:openapi/api.dart';

const noneItemId = '__none__';

class PortRange {
  final int start;
  final int end;

  const PortRange(this.start, this.end);

  const PortRange.single(int port) : start = port, end = port;

  @override
  String toString() {
    if (start == end) {
      return start.toString();
    }

    return '$start–$end';
  }
}

String? portNumberValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a port number';
  }

  final port = int.tryParse(value);
  if (port == null || port < 1 || port > 65535) {
    return 'Invalid port number';
  }

  return null;
}

class CreateFirewallRulePage extends StatefulWidget {
  const CreateFirewallRulePage({super.key});

  @override
  State<CreateFirewallRulePage> createState() => _CreateFirewallRulePageState();
}

class _CreateFirewallRulePageState extends State<CreateFirewallRulePage> {
  final _firewallRepository = FirewallRepository.instance;
  var _protocol = NetworkProtocol.tcp;
  String _sourceNetwork = '0.0.0.0/0';
  PortRange _portRange = PortRange.single(0);
  String? _description;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;
    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoCreateFirewallRulePage(
          protocol: _protocol,
          onProtocolChange: (v) => setState(() => _protocol = v),
          sourceNetwork: _sourceNetwork,
          onSourceNetworkChange: (v) => setState(() => _sourceNetwork = v),
          portRange: _portRange,
          onPortRangeChange: (v) => setState(() => _portRange = v),
          description: _description,
          onDescriptionChange: (v) => setState(() => _description = v),
          onCreatePressed: _handleCreate,
        );
      default:
        return MaterialCreateFirewallRulePage(
          protocol: _protocol,
          onProtocolChange: (v) => setState(() => _protocol = v),
          sourceNetwork: _sourceNetwork,
          onSourceNetworkChange: (v) => setState(() => _sourceNetwork = v),
          portRange: _portRange,
          onPortRangeChange: (v) => setState(() => _portRange = v),
          description: _description,
          onDescriptionChange: (v) => setState(() => _description = v),
          onCreatePressed: _handleCreate,
        );
    }
  }

  void _handleCreate() async {
    final rules = _firewallRepository.firewallRules;
    await _firewallRepository.replace([
      ...rules,
      FirewallRule(
        protocol: _protocol,
        sourceNetwork: _sourceNetwork,
        portRange: [_portRange.start, _portRange.end],
        description: _description ?? '',
      ),
    ]);

    if (mounted) {
      context.pop();
    }
  }
}
