import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/theme_type_provider.dart';

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

  static IconData add(ThemeType themeType) => switch (themeType) {
        ThemeType.cupertino => CupertinoIcons.add,
        ThemeType.material => Icons.add,
        ThemeType.lambda => Icons.add,
      };

  static IconData clear(ThemeType themeType) => switch (themeType) {
        ThemeType.cupertino => CupertinoIcons.trash_circle,
        ThemeType.material => Icons.delete_sweep,
        ThemeType.lambda => Icons.delete_sweep,
      };

  static IconData conversations(ThemeType themeType) => switch (themeType) {
        ThemeType.cupertino => CupertinoIcons.conversation_bubble,
        ThemeType.material => Icons.chat_bubble,
        ThemeType.lambda => Icons.chat_bubble,
      };

  static IconData person(ThemeType themeType) => switch (themeType) {
        ThemeType.cupertino => CupertinoIcons.person,
        ThemeType.material => Icons.person,
        ThemeType.lambda => Icons.person,
      };

  static IconData assistant(ThemeType themeType) => switch (themeType) {
        ThemeType.cupertino => CupertinoIcons.asterisk_circle,
        ThemeType.material => Icons.assistant,
        ThemeType.lambda => Icons.assistant,
      };
}
