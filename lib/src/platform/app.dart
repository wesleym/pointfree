import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/theme_type_provider.dart';

const lambdaIndigo = Color(0xff4027ff);
const lambdaIndigoLight = Color(0xffb9b1fd);

ThemeData makeLambdaTheme({required TargetPlatform platform}) {
  final colors = ColorScheme(
    brightness: Brightness.light,
    primary: lambdaIndigo,
    onPrimary: Colors.white,
    secondary: lambdaIndigoLight,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  var typography =
      Typography.material2021(platform: platform, colorScheme: colors);
  final defaultTextTheme = typography.englishLike
      .merge(switch (colors.brightness) {
        Brightness.light => typography.black,
        Brightness.dark => typography.white,
      })
      .apply(fontFamily: 'Berkeley Mono');

  return ThemeData(
    brightness: colors.brightness,
    colorScheme: colors,
    platform: platform,
    textTheme: defaultTextTheme,
    buttonTheme: ButtonThemeData(shape: BeveledRectangleBorder()),
  );
}

ThemeData makeTheme(
    {required TargetPlatform platform, required ColorScheme colorScheme}) {
  var typography =
      Typography.material2021(platform: platform, colorScheme: colorScheme);
  final defaultTextTheme = typography.englishLike
      .merge(switch (colorScheme.brightness) {
        Brightness.light => typography.black,
        Brightness.dark => typography.white,
      })
      .apply(fontFamily: 'Berkeley Mono');

  return ThemeData(
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
    final themeType = ThemeTypeProvider.of(context).themeType;

    return switch (themeType) {
      ThemeType.cupertino => CupertinoApp.router(
          title: title,
          localizationsDelegates: [DefaultMaterialLocalizations.delegate],
          routerConfig: _routerConfig,
        ),
      ThemeType.material => DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) => MaterialApp.router(
            title: title,
            routerConfig: _routerConfig,
            theme: ThemeData(
              colorScheme: lightDynamic ?? ColorScheme.light(),
              platform: platform,
            ),
            darkTheme: ThemeData(
              colorScheme: darkDynamic ?? ColorScheme.dark(),
              platform: platform,
            ),
          ),
        ),
      ThemeType.lambda => MaterialApp.router(
          title: title,
          routerConfig: _routerConfig,
          theme: makeLambdaTheme(platform: platform),
        ),
    };
  }
}
