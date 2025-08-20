import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/login/store.dart';
import 'package:pointfree/src/platform/list_tile.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/theme_type_provider.dart';

const _aboutBody =
    'Pointfree is a graphical user interface for the Lambda Cloud API and the Lambda Inference API.';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeType = ThemeTypeProvider.of(context).themeType;

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
                PlatformListTile(
                  title: Text('About'),
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text('Pointfree'),
                          content: RawGestureDetector(
                            gestures: {
                              DelayedMultiDragGestureRecognizer:
                                  GestureRecognizerFactoryWithHandlers<
                                    DelayedMultiDragGestureRecognizer
                                  >(
                                    () => DelayedMultiDragGestureRecognizer(
                                      delay: Duration(seconds: 4),
                                    ),
                                    (instance) {
                                      instance.onStart = (details) {
                                        final themeTypeProvider =
                                            ThemeTypeProvider.of(context);
                                        final nextThemeType =
                                            ThemeType.values[(themeTypeProvider
                                                        .themeType
                                                        .index +
                                                    1) %
                                                ThemeType.values.length];
                                        themeTypeProvider.overrideTheme(
                                          nextThemeType,
                                        );
                                        return null;
                                      };
                                    },
                                  ),
                            },
                            child: Text(_aboutBody),
                          ),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () => context.pop(),
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
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
          PlatformListTile(
            title: Text('About'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Pointfree'),
                    content: RawGestureDetector(
                      gestures: {
                        DelayedMultiDragGestureRecognizer:
                            GestureRecognizerFactoryWithHandlers<
                              DelayedMultiDragGestureRecognizer
                            >(
                              () => DelayedMultiDragGestureRecognizer(
                                delay: Duration(seconds: 4),
                              ),
                              (instance) {
                                instance.onStart = (details) {
                                  final themeTypeProvider =
                                      ThemeTypeProvider.of(context);
                                  final nextThemeType =
                                      ThemeType.values[(themeTypeProvider
                                                  .themeType
                                                  .index +
                                              1) %
                                          ThemeType.values.length];
                                  themeTypeProvider.overrideTheme(
                                    nextThemeType,
                                  );
                                  return null;
                                };
                              },
                            ),
                      },
                      child: Text(_aboutBody),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
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
