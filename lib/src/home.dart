import 'package:flutter/material.dart';
import 'package:lambda_gui/src/chat/page.dart';
import 'package:lambda_gui/src/filesystems/create.dart';
import 'package:lambda_gui/src/filesystems/list.dart';
import 'package:lambda_gui/src/instances/launch.dart';
import 'package:lambda_gui/src/instances/list.dart';
import 'package:lambda_gui/src/platform/tab_scaffold.dart';
import 'package:lambda_gui/src/ssh/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    Widget? primaryActionIcon;
    if (platform != TargetPlatform.iOS && platform != TargetPlatform.macOS) {
      switch (_selectedIndex) {
        case 0:
        case 1:
          primaryActionIcon = Icon(Icons.add);
          break;
      }
    }
    return PlatformTabScaffold(
      primaryActionIcon: primaryActionIcon,
      onPrimaryActionSelected: () {
        switch (_selectedIndex) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => LaunchInstancePage()));
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => CreateFilesystemPage()));
            break;
        }
      },
      onTabTapped: (index) => setState(() => _selectedIndex = index),
      builder: (context, index) {
        switch (index) {
          case 0:
            return InstancesList();
          case 1:
            return FilesystemsList();
          case 2:
            return SshKeysList();
          case 3:
            return ChatPage();
          default:
            return InstancesList();
        }
      },
    );
  }
}
