import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class PlatformCircularProgressIndicator extends StatelessWidget {
  const PlatformCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context);
    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoActivityIndicator();
      case ThemeType.material:
      case ThemeType.lambda:
        return CircularProgressIndicator();
    }
  }
}
