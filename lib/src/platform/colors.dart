import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformColors {
  static Color destructive(TargetPlatform platform) => switch (platform) {
        TargetPlatform.iOS => CupertinoColors.destructiveRed,
        TargetPlatform.macOS => CupertinoColors.destructiveRed,
        TargetPlatform.android => Colors.red,
        TargetPlatform.fuchsia => Colors.red,
        TargetPlatform.linux => Colors.red,
        TargetPlatform.windows => Colors.red,
      };
}
