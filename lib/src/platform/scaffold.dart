import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScaffold extends StatelessWidget {
  final Widget Function(BuildContext context, int index) _builder;

  const PlatformScaffold({
    super.key,
    required Widget Function(BuildContext context, int index) builder,
  }) : _builder = builder;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.desktopcomputer), label: 'Instances'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder), label: 'Filesystems'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.lock), label: 'SSH'),
          ]),
          tabBuilder: _builder,
        );
      default:
        return _MaterialTabScaffold(builder: _builder);
    }
  }
}

class _MaterialTabScaffold extends StatefulWidget {
  final Widget Function(BuildContext context, int index) _builder;

  const _MaterialTabScaffold({
    required Widget Function(BuildContext context, int index) builder,
  }) : _builder = builder;

  @override
  State<StatefulWidget> createState() => _MaterialTabScaffoldState();
}

class _MaterialTabScaffoldState extends State<_MaterialTabScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _selectedIndex = value,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.computer), label: 'Instances'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Filesystems'),
          BottomNavigationBarItem(icon: Icon(Icons.key), label: 'SSH'),
        ],
      ),
      body: Builder(
        builder: (context) => widget._builder(context, _selectedIndex),
      ),
    );
  }
}
