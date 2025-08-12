import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class PlatformColors {
  static Color destructive(ThemeType themeType) => switch (themeType) {
        ThemeType.cupertino => CupertinoColors.destructiveRed,
        ThemeType.material => Colors.red,
        ThemeType.lambda => Colors.red,
      };
}
