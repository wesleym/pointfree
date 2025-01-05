import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTextButton extends StatelessWidget {
  const PlatformTextButton({
    super.key,
    EdgeInsetsGeometry? cupertinoPadding,
    required void Function()? onPressed,
    required Widget child,
  })  : _cupertinoPadding = cupertinoPadding,
        _onPressed = onPressed,
        _child = child;

  final EdgeInsetsGeometry? _cupertinoPadding;
  final void Function()? _onPressed;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoButton(
          onPressed: _onPressed,
          padding: _cupertinoPadding,
          child: _child,
        );
      default:
        return TextButton(onPressed: _onPressed, child: _child);
    }
  }
}
