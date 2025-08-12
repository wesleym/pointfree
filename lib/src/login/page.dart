import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/login/store.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/text_button.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _store = LoginStore.instance;
  final _apiKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context);
    final apiKeyField = switch (themeType) {
      ThemeType.cupertino => CupertinoTextField(
          placeholder: 'API Key',
          controller: _apiKeyController,
        ),
      ThemeType.material || ThemeType.lambda => TextField(
          controller: _apiKeyController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('API Key'),
          ),
        ),
    };
    final apiKeyStyle = switch (themeType) {
      ThemeType.cupertino =>
        CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      ThemeType.material ||
      ThemeType.lambda =>
        Theme.of(context).textTheme.titleLarge,
    };
    return PlatformScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text('Application', style: apiKeyStyle),
            Text('for Lambda Cloud'),
            apiKeyField,
            PlatformTextButton(
              onPressed: () async {
                await _store.setApiKey(_apiKeyController.text);
                if (context.mounted) context.go('/');
              },
              child: Text('Set'),
            ),
          ],
        ),
      ),
    );
  }
}
