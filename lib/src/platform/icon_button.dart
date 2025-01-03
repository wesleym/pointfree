import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformIconButton extends StatelessWidget {
  const PlatformIconButton(
      {super.key, required void Function()? onPressed, required Widget icon})
      : _onPressed = onPressed,
        _icon = icon;

  final void Function()? _onPressed;
  final Widget _icon;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _onPressed,
          child: _icon,
        );
      default:
        return IconButton(onPressed: _onPressed, icon: _icon);
    }
  }
}
