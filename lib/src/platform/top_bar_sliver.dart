import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBarSliver extends StatelessWidget {
  final Widget? _title;

  const TopBarSliver({super.key, Widget? title}) : _title = title;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoSliverNavigationBar(largeTitle: _title);
      default:
        return SliverAppBar.large(title: _title);
    }
  }
}
