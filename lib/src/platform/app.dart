import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const lambdaIndigo = Color(0xff4027ff);
const lambdaIndigoLight = Color(0xffb9b1fd);

ThemeData makeTheme({required ColorScheme colorScheme}) {
  final platform = TargetPlatform.fuchsia;
  final defaultTextTheme =
      Typography.material2021(platform: platform, colorScheme: colorScheme)
          .englishLike
          .apply(fontFamily: 'Berkeley Mono');
  // var mitrTextTheme = GoogleFonts.mitrTextTheme(
  // var robotoMonoTextTheme = GoogleFonts.robotoMonoTextTheme(
  //     Typography.material2021(platform: platform, colorScheme: colorScheme)
  //         .englishLike);
  // var mitrTextTheme = GoogleFonts.mitrTextTheme(
  //     Typography.material2021(platform: platform, colorScheme: colorScheme)
  //         .englishLike);
  // return ThemeData(
  //   brightness: colorScheme.brightness,
  //   colorScheme: colorScheme,
  //   platform: platform,
  //   textTheme: robotoMonoTextTheme.copyWith(
  //     headlineLarge: GoogleFonts.mitr(textStyle: mitrTextTheme.headlineLarge),
  //     headlineMedium: GoogleFonts.mitr(textStyle: mitrTextTheme.headlineMedium),
  //     headlineSmall: GoogleFonts.mitr(textStyle: mitrTextTheme.headlineSmall),
  //     titleLarge: GoogleFonts.mitr(textStyle: mitrTextTheme.titleLarge),
  //     titleMedium: GoogleFonts.mitr(textStyle: mitrTextTheme.titleMedium),
  //     titleSmall: GoogleFonts.mitr(textStyle: mitrTextTheme.titleSmall),
  //   ),
  // );
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
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      // return CupertinoApp.router(
      //   title: title,
      //   localizationsDelegates: [DefaultMaterialLocalizations.delegate],
      //   routerConfig: _routerConfig,
      // );
      default:
        return DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) => MaterialApp.router(
            title: title,
            routerConfig: _routerConfig,
            // theme: makeTheme(
            //   colorScheme: lightDynamic ??
            //       ColorScheme.fromSeed(
            //           seedColor: Colors.indigo, brightness: Brightness.dark),
            // ),
            // darkTheme: makeTheme(
            //   colorScheme: darkDynamic ??
            //       ColorScheme.fromSeed(
            //           seedColor: Colors.indigo, brightness: Brightness.dark),
            // ),
            theme: makeTheme(
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
