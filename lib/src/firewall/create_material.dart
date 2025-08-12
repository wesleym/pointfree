import 'package:flutter/material.dart';
import 'package:pointfree/src/firewall/create.dart';
import 'package:pointfree/src/firewall/description_dialog.dart';
import 'package:pointfree/src/firewall/port_range_dialog.dart';
import 'package:pointfree/src/firewall/protocol_picker_dialog.dart';
import 'package:pointfree/src/firewall/source_dialog.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:openapi/api.dart';

class MaterialCreateFirewallRulePage extends StatelessWidget {
  final NetworkProtocol _protocol;
  final void Function(NetworkProtocol protocol) _onProtocolChange;
  final String _sourceNetwork;
  final void Function(String sourceNetwork) _onSourceNetworkChange;
  final PortRange _portRange;
  final void Function(PortRange portRange) _onPortRangeChange;
  final String? _description;
  final void Function(String? description) _onDescriptionChange;
  final void Function()? _onCreatePressed;

  const MaterialCreateFirewallRulePage({
    super.key,
    required NetworkProtocol protocol,
    required void Function(NetworkProtocol) onProtocolChange,
    required String sourceNetwork,
    required void Function(String) onSourceNetworkChange,
    required PortRange portRange,
    required void Function(PortRange) onPortRangeChange,
    required String? description,
    required void Function(String?) onDescriptionChange,
    void Function()? onCreatePressed,
  })  : _protocol = protocol,
        _onProtocolChange = onProtocolChange,
        _sourceNetwork = sourceNetwork,
        _onSourceNetworkChange = onSourceNetworkChange,
        _portRange = portRange,
        _onPortRangeChange = onPortRangeChange,
        _description = description,
        _onDescriptionChange = onDescriptionChange,
        _onCreatePressed = onCreatePressed;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Firewall rule')),
      body: ListView(children: [
        ListTile(
          onTap: () => _handleProtocolTap(context),
          title: Text('Region'),
          subtitle: Text(_protocol.value),
        ),
        ListTile(
          onTap: () => _handlePortRangeTap(context),
          title: Text('Port range'),
          subtitle: Text(_portRange.toString()),
        ),
        ListTile(
          onTap: () => _handleSourceTap(context),
          title: Text('Source'),
          subtitle: Text(_sourceNetwork),
        ),
        ListTile(
          onTap: () => _handleDescriptionTap(context),
          title: Text('Description'),
          subtitle: Text(_description ?? ''),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _onCreatePressed,
            child: Text('Create'),
          ),
        ),
      ]),
    );
  }

  void _handlePortRangeTap(BuildContext context) async {
    final portRange = await showDialog<PortRange>(
        context: context,
        builder: (context) => PortRangeDialog(initialPortRange: _portRange));

    if (portRange != null && portRange != _portRange) {
      _onPortRangeChange(portRange);
    }
  }

  void _handleSourceTap(BuildContext context) async {
    final source = await showDialog<String?>(
        context: context,
        builder: (context) => SourceDialog(initialSource: _sourceNetwork));

    if (source != null && source != _sourceNetwork) {
      _onSourceNetworkChange(source);
    }
  }

  void _handleDescriptionTap(BuildContext context) async {
    final description = await showDialog<String?>(
        context: context,
        builder: (context) =>
            DescriptionDialog(initialDescription: _description));

    if (description != null && description != _description) {
      _onDescriptionChange(description);
    }
  }

  void _handleProtocolTap(BuildContext context) async {
    final protocol = await showDialog<NetworkProtocol>(
        context: context, builder: (context) => ProtocolPickerDialog());

    if (protocol != null && protocol != _protocol) {
      _onProtocolChange(protocol);
    }
  }
}
