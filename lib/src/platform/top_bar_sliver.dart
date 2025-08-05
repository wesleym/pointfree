import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class PlatformTopBarSliver extends StatelessWidget {
  final Widget? _title;
  final Widget? _action;

  const PlatformTopBarSliver({super.key, Widget? title, Widget? action})
      : _title = title,
        _action = action;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context);

    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoSliverNavigationBar(
            largeTitle: _title, trailing: _action);
      case ThemeType.material:
      case ThemeType.lambda:
        // At the moment, the _action is not passed through. This is because the primary _action is usually attached to a floating action button.
        return SliverAppBar.large(title: _title);
    }
  }
}
