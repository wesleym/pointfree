import 'package:flutter/cupertino.dart';
import 'package:pointfree/src/firewall/create.dart';
import 'package:pointfree/src/firewall/protocol_picker_page.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:openapi/api.dart';

class CupertinoCreateFirewallRulePage extends StatelessWidget {
  final NetworkProtocol _protocol;
  final void Function(NetworkProtocol protocol) _onProtocolChange;
  final String _sourceNetwork;
  final void Function(String sourceNetwork) _onSourceNetworkChange;
  final PortRange _portRange;
  final void Function(PortRange portRange) _onPortRangeChange;
  final String? _description;
  final void Function(String? description) _onDescriptionChange;
  final void Function()? _onCreatePressed;

  const CupertinoCreateFirewallRulePage({
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
  }) : _protocol = protocol,
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
    Color? backgroundColor;

    backgroundColor = CupertinoColors.systemGroupedBackground;

    return PlatformScaffold(
      backgroundColor: backgroundColor,
      topBar: PlatformTopBar(),
      body: Form(
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              hasLeading: false,
              children: [
                CupertinoListTile.notched(
                  onTap: () => _handleProtocolTap(context),
                  title: Text('Protocol'),
                  additionalInfo: Text(_protocol.value),
                  trailing: CupertinoListTileChevron(),
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Port range start'),
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  validator: portNumberValidator,
                  onChanged: (value) => _onPortRangeChange(
                    PortRange(int.parse(value), _portRange.end),
                  ),
                  initialValue: _portRange.start.toString(),
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Port range end'),
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  validator: portNumberValidator,
                  onChanged: (value) => _onPortRangeChange(
                    PortRange(_portRange.start, int.parse(value)),
                  ),
                  initialValue: _portRange.start.toString(),
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Source'),
                  textAlign: TextAlign.end,
                  onChanged: _onSourceNetworkChange,
                  initialValue: _sourceNetwork,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Description'),
                  textAlign: TextAlign.end,
                  onChanged: _onDescriptionChange,
                  initialValue: _description,
                ),
              ],
            ),
            CupertinoButton(
              onPressed: _onCreatePressed,
              child: Text(
                'Create',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleProtocolTap(BuildContext context) async {
    final protocol = await Navigator.of(context).push<NetworkProtocol>(
      CupertinoPageRoute(builder: (context) => ProtocolPickerPage()),
    );

    if (protocol != null && protocol != _protocol) {
      _onProtocolChange(protocol);
    }
  }
}
