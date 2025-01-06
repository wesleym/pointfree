import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            theme: ThemeData(
              colorScheme: lightDynamic,
              // platform: TargetPlatform.fuchsia,
            ),
            darkTheme: ThemeData(
              colorScheme: darkDynamic,
              // platform: TargetPlatform.fuchsia,
            ),
          ),
        );
    }
  }
}
