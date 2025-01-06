import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData makeTheme({Brightness? brightness, ColorScheme? colorScheme}) {
  // var platform = TargetPlatform.fuchsia;
  return ThemeData(
    brightness: brightness,
    colorScheme: colorScheme,
    // platform: platform,
    // textTheme: GoogleFonts.robotoMonoTextTheme().copyWith(
    //   headlineLarge: GoogleFonts.mitr(
    //       textStyle: Typography.material2021().englishLike.headlineLarge),
    //   headlineMedium: GoogleFonts.mitr(
    //       textStyle: Typography.material2021().englishLike.headlineMedium),
    //   headlineSmall: GoogleFonts.mitr(
    //       textStyle: Typography.material2021().englishLike.headlineSmall),
    //   titleLarge: GoogleFonts.mitr(
    //       textStyle: Typography.material2021().englishLike.titleLarge),
    //   titleMedium: GoogleFonts.mitr(
    //       textStyle: Typography.material2021().englishLike.titleMedium),
    //   titleSmall: GoogleFonts.mitr(
    //       textStyle: Typography.material2021().englishLike.titleSmall),
    // ),
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
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoApp.router(
          title: title,
          localizationsDelegates: [DefaultMaterialLocalizations.delegate],
          routerConfig: _routerConfig,
        );
      default:
        return DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) => MaterialApp.router(
            title: title,
            routerConfig: _routerConfig,
            theme: makeTheme(
              brightness: Brightness.light,
              colorScheme: lightDynamic,
            ),
            darkTheme: makeTheme(
              brightness: Brightness.dark,
              colorScheme: darkDynamic,
            ),
          ),
        );
    }
  }
}
