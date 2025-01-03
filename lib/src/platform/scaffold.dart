import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScaffold extends StatelessWidget {
  final Widget? body;

  const PlatformScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.desktopcomputer)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder)),
          ]),
          tabBuilder: (context, index) => body ?? Text('hi'),
        );
      default:
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.computer)),
            BottomNavigationBarItem(icon: Icon(Icons.folder)),
          ]),
          body: body ?? Text('hi'),
        );
    }
  }
}
