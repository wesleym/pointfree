import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/login/store.dart';
import 'package:pointfree/src/platform/list_tile.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeType = ThemeTypeProvider.of(context);

    final list = switch (themeType) {
      ThemeType.cupertino => ColoredBox(
          color: CupertinoColors.systemGroupedBackground,
          child: ListView(
            children: [
              CupertinoListSection(
                hasLeading: false,
                children: [
                  PlatformListTile(
                    title: Text('Storage'),
                    onTap: () => context.go('/filesystems'),
                  ),
                  PlatformListTile(
                    title: Text('SSH keys'),
                    onTap: () => context.go('/ssh'),
                  ),
                  PlatformListTile(
                    title: Text('Firewall'),
                    onTap: () => context.go('/firewall'),
                  ),
                ],
              ),
              CupertinoListSection(
                hasLeading: false,
                children: [
                  PlatformListTile(
                    title: Text('Clear API key'),
                    onTap: () => _clearApiKey(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ThemeType.material || ThemeType.lambda => ListView(
          children: [
            PlatformListTile(
              title: Text('Storage'),
              onTap: () => context.go('/filesystems'),
            ),
            PlatformListTile(
              title: Text('SSH keys'),
              onTap: () => context.go('/ssh'),
            ),
            PlatformListTile(
              title: Text('Firewall'),
              onTap: () => context.go('/firewall'),
            ),
            Divider(),
            PlatformListTile(
              title: Text('Clear API key'),
              onTap: () => _clearApiKey(context),
            ),
          ],
        ),
    };

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Resources')),
      body: list,
    );
  }

  Future<void> _clearApiKey(BuildContext context) async {
    await LoginStore.instance.setApiKey(null);
    if (context.mounted) context.go('/login');
  }
}
