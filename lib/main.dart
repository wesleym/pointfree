import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/list.dart';
import 'package:lambda_gui/src/instances/list.dart';
import 'package:lambda_gui/src/platform/app.dart';
import 'package:lambda_gui/src/platform/tab_scaffold.dart';
import 'package:lambda_gui/src/router.dart';
import 'package:lambda_gui/src/secrets.dart';
import 'package:lambda_gui/src/ssh/list.dart';
import 'package:openapi/api.dart';

void main() {
  defaultApiClient = ApiClient(
      authentication: ApiKeyAuth('header', 'Authorization')
        ..apiKeyPrefix = 'Bearer'
        ..apiKey = apiKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp.router(
      title: 'Lambda Cloud',
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    Widget? primaryActionIcon;
    if (_selectedIndex == 0 &&
        platform != TargetPlatform.iOS &&
        platform != TargetPlatform.macOS) {
      // TODO: Platform icons. This one is always Material because it's for the FAB.
      primaryActionIcon = Icon(Icons.add);
    }
    return PlatformTabScaffold(
      primaryActionIcon: primaryActionIcon,
      onPrimaryActionSelected: () => context.go('/instances/launch'),
      onTabTapped: (index) => setState(() => _selectedIndex = index),
      builder: (context, index) {
        switch (index) {
          case 0:
            return InstancesList();
          case 1:
            return FilesystemsList();
          case 2:
            return SshKeysList();
          default:
            return FilesystemsList();
        }
      },
    );
  }
}
