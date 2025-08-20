import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class PlatformListTile extends StatelessWidget {
  final FutureOr<void> Function()? _onTap;
  final Widget title;
  final Widget? _subtitle;

  const PlatformListTile({
    super.key,
    FutureOr<void> Function()? onTap,
    required this.title,
    Widget? subtitle,
  }) : _onTap = onTap,
       _subtitle = subtitle;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;
    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoListTile(
          onTap: _onTap,
          title: title,
          additionalInfo: _subtitle,
        );
      case ThemeType.material:
      case ThemeType.lambda:
        return ListTile(onTap: _onTap, title: title, subtitle: _subtitle);
    }
  }
}
