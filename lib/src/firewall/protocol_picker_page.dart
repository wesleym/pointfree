import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/platform/list_tile.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:openapi/api.dart';

class ProtocolPickerPage extends StatelessWidget {
  const ProtocolPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final protocols = NetworkProtocol.values;

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Protocol')),
      body: ListView.builder(
        itemCount: protocols.length,
        itemBuilder: (BuildContext context, int index) {
          return PlatformListTile(
            onTap: () => _onSelectProtocol(context, protocols[index]),
            title: Text(protocols[index].value),
          );
        },
      ),
    );
  }

  void _onSelectProtocol(BuildContext context, NetworkProtocol protocol) =>
      context.pop(protocol);
}
