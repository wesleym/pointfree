import 'package:flutter/material.dart';
import 'package:lambda_gui/src/chat/page.dart';
import 'package:lambda_gui/src/instances/launch.dart';
import 'package:lambda_gui/src/instances/list.dart';
import 'package:lambda_gui/src/more/page.dart';
import 'package:lambda_gui/src/platform/tab_scaffold.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context);
    Widget? primaryActionIcon;
    if (themeType != ThemeType.cupertino) {
      switch (_selectedIndex) {
        case 0:
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
        }
      },
      onTabTapped: (index) => setState(() => _selectedIndex = index),
      builder: (context, index) {
        switch (index) {
          case 0:
            return InstancesList();
          case 1:
            return ChatPage();
          case 2:
            return MorePage();
          default:
            return InstancesList();
        }
      },
    );
  }
}
