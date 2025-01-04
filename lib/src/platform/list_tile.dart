import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformListTile extends StatelessWidget {
  final FutureOr<void> Function()? _onTap;
  final Widget title;

  const PlatformListTile(
      {super.key, FutureOr<void> Function()? onTap, required this.title})
      : _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoListTile(onTap: _onTap, title: title);
      default:
        return ListTile(onTap: _onTap, title: title);
    }
  }
}
