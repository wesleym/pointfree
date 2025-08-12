import 'package:flutter/material.dart';
import 'package:pointfree/src/platform/app.dart';
import 'package:pointfree/src/router.dart';
import 'package:pointfree/src/theme_type_provider.dart';

// ignore: unnecessary_nullable_for_final_variable_declarations
// const ThemeType? themeOverride = ThemeType.lambda;
// ignore: unnecessary_nullable_for_final_variable_declarations
// const ThemeType? themeOverride = ThemeType.material;
const ThemeType? themeOverride = null;

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return ThemeTypeProvider(
      themeType: themeOverride ?? resolveThemeType(platform),
      child: PlatformApp.router(title: 'Lambda Cloud', routerConfig: router),
    );
  }
}
