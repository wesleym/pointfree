import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformIcons {
  static IconData delete(TargetPlatform platform) => switch (platform) {
        TargetPlatform.iOS => CupertinoIcons.delete,
        TargetPlatform.macOS => CupertinoIcons.delete,
        TargetPlatform.android => Icons.delete,
        TargetPlatform.fuchsia => Icons.delete,
        TargetPlatform.linux => Icons.delete,
        TargetPlatform.windows => Icons.delete,
      };
}
