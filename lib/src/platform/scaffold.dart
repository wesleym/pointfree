import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScaffold extends StatelessWidget {
  final Widget? _primaryActionIcon;
  final void Function()? _onPrimaryActionSelected;
  final Widget _body;

  const PlatformScaffold({
    super.key,
    Widget? primaryActionIcon,
    void Function()? onPrimaryActionSelected,
    required Widget body,
  })  : _primaryActionIcon = primaryActionIcon,
        _onPrimaryActionSelected = onPrimaryActionSelected,
        _body = body;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoPageScaffold(
          child: _body,
        );
      default:
        Widget? fab;
        if (_primaryActionIcon != null) {
          fab = FloatingActionButton(
            onPressed: _onPrimaryActionSelected,
            child: _primaryActionIcon,
          );
        }
        return Scaffold(floatingActionButton: fab, body: _body);
    }
  }
}
