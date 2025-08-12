import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { cupertino, material, lambda }

// ignore: unnecessary_nullable_for_final_variable_declarations
// const ThemeType? themeOverride = ThemeType.lambda;
// ignore: unnecessary_nullable_for_final_variable_declarations
const ThemeType? themeOverride = ThemeType.material;
// const ThemeType? themeOverride = null;

ThemeType resolveThemeType(TargetPlatform targetPlatform) =>
    switch (targetPlatform) {
      TargetPlatform.iOS => ThemeType.cupertino,
      TargetPlatform.macOS => ThemeType.cupertino,
      _ => ThemeType.material,
    };

class ThemeTypeHolder extends StatefulWidget {
  const ThemeTypeHolder({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() => ThemeTypeHolderState();
}

class ThemeTypeHolderState extends State<ThemeTypeHolder> {
  late ThemeType _themeType;

  @override
  void initState() {
    super.initState();

    final targetPlatform = Theme.of(context).platform;
    _themeType = themeOverride ?? resolveThemeType(targetPlatform);
    SharedPreferencesAsync().getString('themeType').then((value) {
      if (value != null) {
        for (final themeType in ThemeType.values) {
          if (themeType.name == value) {
            setState(() => _themeType = themeType);
            return;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeTypeProvider(
      themeType: _themeType,
      onOverride: (themeType) {
        setState(() => _themeType = themeType);
      },
      child: widget.child,
    );
  }
}

/// InheritedWidget that provides ThemeType to descendant widgets
class ThemeTypeProvider extends InheritedWidget {
  const ThemeTypeProvider({
    super.key,
    required this.themeType,
    required this.onOverride,
    required super.child,
  });

  final ThemeType themeType;
  final void Function(ThemeType) onOverride;

  /// Get the ThemeType from the nearest ThemeTypeProvider ancestor
  static ThemeTypeProvider of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No ThemeType found in context');
    return result!;
  }

  /// Get the ThemeType from the nearest ThemeTypeProvider ancestor, or null if not found
  static ThemeTypeProvider? maybeOf(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeTypeProvider>();
    return provider;
  }

  @override
  bool updateShouldNotify(ThemeTypeProvider oldWidget) {
    return themeType != oldWidget.themeType ||
        onOverride != oldWidget.onOverride;
  }

  void overrideTheme(ThemeType themeType) async {
    onOverride(themeType);
    await SharedPreferencesAsync().setString('themeType', themeType.toString());
  }
}
