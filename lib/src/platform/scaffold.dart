import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class PlatformScaffold extends StatelessWidget {
  final Widget? _primaryActionIcon;
  final void Function()? _onPrimaryActionSelected;
  final Color? _backgroundColor;
  final PlatformTopBar? _topBar;
  final Widget _body;

  const PlatformScaffold({
    super.key,
    Widget? primaryActionIcon,
    void Function()? onPrimaryActionSelected,
    Color? backgroundColor,
    PlatformTopBar? topBar,
    required Widget body,
  })  : _primaryActionIcon = primaryActionIcon,
        _onPrimaryActionSelected = onPrimaryActionSelected,
        _backgroundColor = backgroundColor,
        _topBar = topBar,
        _body = body;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context);
    switch (themeType) {
      case ThemeType.cupertino:
        CupertinoNavigationBar? navigationBar;
        if (_topBar != null) {
          navigationBar = CupertinoNavigationBar(
            middle: _topBar.title,
            trailing: _topBar.action,
          );
        }
        return CupertinoPageScaffold(
          backgroundColor: _backgroundColor,
          navigationBar: navigationBar,
          child: _body,
        );
      case ThemeType.material:
      case ThemeType.lambda:
        AppBar? appBar;
        if (_topBar != null) {
          final actions = <Widget>[];
          final thisAction = _topBar.action;
          if (thisAction != null) {
            actions.add(thisAction);
          }
          appBar = AppBar(
            title: _topBar.title,
            actions: actions,
          );
        }
        Widget? fab;
        if (_primaryActionIcon != null) {
          fab = FloatingActionButton(
            onPressed: _onPrimaryActionSelected,
            child: _primaryActionIcon,
          );
        }
        return Scaffold(
          backgroundColor: _backgroundColor,
          appBar: appBar,
          floatingActionButton: fab,
          body: _body,
        );
    }
  }
}

class PlatformTopBar {
  final Widget? title;
  final Widget? action;

  const PlatformTopBar({this.title, this.action});
}
