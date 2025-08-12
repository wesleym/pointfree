import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class PlatformTabScaffold extends StatelessWidget {
  final Widget? _primaryActionIcon;
  final void Function()? _onPrimaryActionSelected;
  final void Function(int)? _onTabTapped;
  final Widget Function(BuildContext context, int index) _builder;

  const PlatformTabScaffold({
    super.key,
    Widget? primaryActionIcon,
    void Function()? onPrimaryActionSelected,
    void Function(int)? onTabTapped,
    required Widget Function(BuildContext context, int index) builder,
  })  : _primaryActionIcon = primaryActionIcon,
        _onPrimaryActionSelected = onPrimaryActionSelected,
        _onTabTapped = onTabTapped,
        _builder = builder;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context);
    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(onTap: _onTabTapped, items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.desktopcomputer), label: 'Instances'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble), label: 'Chat'),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.rectangle_on_rectangle_angled),
              label: 'Resources',
            ),
          ]),
          tabBuilder: _builder,
        );
      case ThemeType.material:
      case ThemeType.lambda:
        return _MaterialTabScaffold(
          primaryActionIcon: _primaryActionIcon,
          onPrimaryActionSelected: _onPrimaryActionSelected,
          onTabTapped: _onTabTapped,
          builder: _builder,
        );
    }
  }
}

class _MaterialTabScaffold extends StatefulWidget {
  final Widget? _primaryActionIcon;
  final void Function()? _onPrimaryActionSelected;
  final void Function(int)? _onTabTapped;
  final Widget Function(BuildContext context, int index) _builder;

  const _MaterialTabScaffold({
    Widget? primaryActionIcon,
    void Function()? onPrimaryActionSelected,
    void Function(int index)? onTabTapped,
    required Widget Function(BuildContext context, int index) builder,
  })  : _primaryActionIcon = primaryActionIcon,
        _onPrimaryActionSelected = onPrimaryActionSelected,
        _onTabTapped = onTabTapped,
        _builder = builder;

  @override
  State<StatefulWidget> createState() => _MaterialTabScaffoldState();
}

class _MaterialTabScaffoldState extends State<_MaterialTabScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget? fab;
    if (widget._primaryActionIcon != null) {
      fab = FloatingActionButton(
        onPressed: widget._onPrimaryActionSelected,
        child: widget._primaryActionIcon,
      );
    }
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          _selectedIndex = value;
          widget._onTabTapped?.call(value);
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.computer), label: 'Instances'),
          NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.shelves), label: 'Resources'),
        ],
      ),
      floatingActionButton: fab,
      body: Builder(
        builder: (context) => widget._builder(context, _selectedIndex),
      ),
    );
  }
}
