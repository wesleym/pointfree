import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class PlatformIcons {
  PlatformIcons._();

  static IconData delete(ThemeType themeType) => switch (themeType) {
        ThemeType.cupertino => CupertinoIcons.delete,
        ThemeType.material => Icons.delete,
        ThemeType.lambda => Icons.delete,
      };

  static IconData refresh(ThemeType themeType) => switch (themeType) {
        ThemeType.cupertino => CupertinoIcons.refresh,
        ThemeType.material => Icons.refresh,
        ThemeType.lambda => Icons.refresh,
      };
}
