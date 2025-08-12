import 'package:flutter/material.dart';
import 'package:pointfree/src/platform/app.dart';
import 'package:pointfree/src/router.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeTypeHolder(
      child: PlatformApp.router(title: 'Pointfree', routerConfig: router),
    );
  }
}
