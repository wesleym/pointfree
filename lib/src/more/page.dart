import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Resources')),
      body: ListView(
        children: [
          PlatformListTile(
            title: Text('Storage'),
            onTap: () => context.go('/filesystems'),
          ),
          PlatformListTile(
            title: Text('SSH Keys'),
            onTap: () => context.go('/ssh'),
          ),
          PlatformListTile(
            title: Text('Firewall'),
            onTap: () => context.go('/firewall'),
          ),
        ],
      ),
    );
  }
}
