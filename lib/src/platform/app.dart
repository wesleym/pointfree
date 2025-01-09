import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ThemeType { cupertino, material, lambda }

const ThemeType? themeOverride = null;

ThemeType resolveThemeType(
    ThemeType? themeOverride, TargetPlatform targetPlatform) {
  if (themeOverride != null) return themeOverride;

  switch (targetPlatform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return ThemeType.cupertino;
    default:
      return ThemeType.material;
  }
}

const lambdaIndigo = Color(0xff4027ff);
const lambdaIndigoLight = Color(0xffb9b1fd);

ThemeData makeTheme(
    {required TargetPlatform platform, required ColorScheme colorScheme}) {
  // final platform = TargetPlatform.fuchsia;
  final defaultTextTheme =
      Typography.material2021(platform: platform, colorScheme: colorScheme)
          .englishLike
          .apply(fontFamily: 'Berkeley Mono');

  return ThemeData(
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    platform: platform,
    textTheme: defaultTextTheme,
  );
}

class PlatformApp extends StatelessWidget {
  final String? title;
  final RouterConfig<Object>? _routerConfig;

  const PlatformApp.router(
      {super.key, this.title, RouterConfig<Object>? routerConfig})
      : _routerConfig = routerConfig;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final themeType = resolveThemeType(themeOverride, platform);
    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoApp.router(
          title: title,
          localizationsDelegates: [DefaultMaterialLocalizations.delegate],
          routerConfig: _routerConfig,
        );
      case ThemeType.material:
        return DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) => MaterialApp.router(
            title: title,
            routerConfig: _routerConfig,
            theme: makeTheme(
              platform:
                  themeOverride == null ? platform : TargetPlatform.fuchsia,
              colorScheme: lightDynamic ??
                  ColorScheme.fromSeed(
                      seedColor: Colors.indigo, brightness: Brightness.dark),
            ),
            darkTheme: makeTheme(
              platform:
                  themeOverride == null ? platform : TargetPlatform.fuchsia,
              colorScheme: darkDynamic ??
                  ColorScheme.fromSeed(
                      seedColor: Colors.indigo, brightness: Brightness.dark),
            ),
          ),
        );
      case ThemeType.lambda:
        return DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) => MaterialApp.router(
            title: title,
            routerConfig: _routerConfig,
            theme: makeTheme(
                platform:
                    themeOverride == null ? platform : TargetPlatform.fuchsia,
                colorScheme: ColorScheme(
                    brightness: Brightness.dark,
                    primary: lambdaIndigo,
                    onPrimary: Colors.white,
                    secondary: lambdaIndigoLight,
                    onSecondary: Colors.white,
                    error: Colors.red,
                    onError: Colors.white,
                    surface: Colors.black,
                    onSurface: Colors.white)),
          ),
        );
    }
  }
}
