import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformApp extends StatelessWidget {
  final String? title;
  final Widget? home;

  const PlatformApp({super.key, this.home, this.title});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoApp(
          title: title,
          home: home,
          localizationsDelegates: [DefaultMaterialLocalizations.delegate],
        );
      default:
        return MaterialApp(title: title, home: home);
    }
  }
}
