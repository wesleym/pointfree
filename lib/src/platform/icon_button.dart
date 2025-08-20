import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class PlatformIconButton extends StatelessWidget {
  const PlatformIconButton({
    super.key,
    required void Function()? onPressed,
    required Widget icon,
  }) : _onPressed = onPressed,
       _icon = icon;

  final void Function()? _onPressed;
  final Widget _icon;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;

    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _onPressed,
          child: _icon,
        );
      case ThemeType.material:
      case ThemeType.lambda:
        return IconButton(onPressed: _onPressed, icon: _icon);
    }
  }
}
