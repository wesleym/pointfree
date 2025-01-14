import 'package:flutter/material.dart';
import 'package:lambda_gui/src/chat/home.dart';
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
    if (_selectedIndex == 0 &&
        platform != TargetPlatform.iOS &&
        platform != TargetPlatform.macOS) {
      // TODO: Platform icons. This one is always Material because it's for the FAB.
      primaryActionIcon = Icon(Icons.add);
    }
    return PlatformTabScaffold(
      primaryActionIcon: primaryActionIcon,
      onPrimaryActionSelected: () {
        Navigator.of(context).push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => LaunchInstancePage()));
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
