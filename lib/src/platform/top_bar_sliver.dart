import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBarSliver extends StatelessWidget {
  final Widget? _title;
  final Widget? _action;

  const TopBarSliver({super.key, Widget? title, Widget? action})
      : _title = title,
        _action = action;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoSliverNavigationBar(
            largeTitle: _title, trailing: _action);
      default:
        // At the moment, the _action is not passed through. This is because the primary _action is usually attached to a floating action button.
        return SliverAppBar.large(title: _title);
    }
  }
}
