import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class PlatformTextButton extends StatelessWidget {
  const PlatformTextButton({
    super.key,
    EdgeInsetsGeometry? cupertinoPadding,
    required void Function()? onPressed,
    required Widget child,
  }) : _cupertinoPadding = cupertinoPadding,
       _onPressed = onPressed,
       _child = child;

  final EdgeInsetsGeometry? _cupertinoPadding;
  final void Function()? _onPressed;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;
    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoButton(
          onPressed: _onPressed,
          padding: _cupertinoPadding,
          child: _child,
        );
      case ThemeType.material:
      case ThemeType.lambda:
        return TextButton(onPressed: _onPressed, child: _child);
    }
  }
}
