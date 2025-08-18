import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class PlatformChatBubble extends StatelessWidget {
  const PlatformChatBubble({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;

    switch (themeType) {
      case ThemeType.cupertino:
        return Padding(
          padding: const EdgeInsets.all(4),
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: CupertinoColors.systemBlue,
            ),
            child: child,
          ),
        );
      case ThemeType.material:
      case ThemeType.lambda:
        return Card.filled(
          color: Theme.of(context).colorScheme.secondary,
          child: child,
        );
    }
  }
}
