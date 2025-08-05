import 'package:flutter/material.dart';

enum ThemeType { cupertino, material, lambda }

ThemeType resolveThemeType(TargetPlatform targetPlatform) =>
    switch (targetPlatform) {
      TargetPlatform.iOS => ThemeType.cupertino,
      TargetPlatform.macOS => ThemeType.cupertino,
      _ => ThemeType.material,
    };

/// InheritedWidget that provides ThemeType to descendant widgets
class ThemeTypeProvider extends InheritedWidget {
  const ThemeTypeProvider({
    super.key,
    required this.themeType,
    required super.child,
  });

  final ThemeType themeType;

  /// Get the ThemeType from the nearest ThemeTypeProvider ancestor
  static ThemeType of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No ThemeType found in context');
    return result!;
  }

  /// Get the ThemeType from the nearest ThemeTypeProvider ancestor, or null if not found
  static ThemeType? maybeOf(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeTypeProvider>();
    return provider?.themeType;
  }

  @override
  bool updateShouldNotify(ThemeTypeProvider oldWidget) {
    return themeType != oldWidget.themeType;
  }
}
