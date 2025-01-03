import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformListTile extends StatelessWidget {
  final Widget title;

  const PlatformListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoListTile(title: title);
      default:
        return ListTile(title: title);
    }
  }
}
