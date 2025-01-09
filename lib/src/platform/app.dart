import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData makeTheme({
  required ColorScheme colorScheme,
}) {
  final platform = TargetPlatform.fuchsia;
  var robotoMonoTextTheme = GoogleFonts.robotoMonoTextTheme(
      Typography.material2021(platform: platform, colorScheme: colorScheme)
          .englishLike);
  var mitrTextTheme = GoogleFonts.mitrTextTheme(
      Typography.material2021(platform: platform, colorScheme: colorScheme)
          .englishLike);
  return ThemeData(
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    platform: platform,
    textTheme: robotoMonoTextTheme.copyWith(
      headlineLarge: GoogleFonts.mitr(textStyle: mitrTextTheme.headlineLarge),
      headlineMedium: GoogleFonts.mitr(textStyle: mitrTextTheme.headlineMedium),
      headlineSmall: GoogleFonts.mitr(textStyle: mitrTextTheme.headlineSmall),
      titleLarge: GoogleFonts.mitr(textStyle: mitrTextTheme.titleLarge),
      titleMedium: GoogleFonts.mitr(textStyle: mitrTextTheme.titleMedium),
      titleSmall: GoogleFonts.mitr(textStyle: mitrTextTheme.titleSmall),
    ),
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
              colorScheme: lightDynamic ??
                  ColorScheme.fromSeed(
                      seedColor: Colors.indigo, brightness: Brightness.dark),
            ),
            darkTheme: makeTheme(
              colorScheme: darkDynamic ??
                  ColorScheme.fromSeed(
                      seedColor: Colors.indigo, brightness: Brightness.dark),
            ),
          ),
        );
    }
  }
}
