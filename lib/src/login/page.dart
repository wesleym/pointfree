import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/login/store.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/text_button.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';
import 'package:openapi/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _store = LoginStore.instance;
  final _apiKeyController = TextEditingController();
  String? _error;

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
    final errorColor = switch (themeType) {
      ThemeType.cupertino => CupertinoColors.destructiveRed,
      ThemeType.material ||
      ThemeType.lambda =>
        Theme.of(context).colorScheme.error,
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
            if (_error != null)
              Text('Error: $_error', style: TextStyle(color: errorColor)),
            PlatformTextButton(
              onPressed: () => _setApiKey(context),
              child: Text('Set'),
            ),
          ],
        ),
      ),
    );
  }

  void _setApiKey(BuildContext context) async {
    setState(() => _error = null);
    final apiKey = _apiKeyController.text;
    try {
      await InstancesApi(ApiClient(
              authentication: ApiKeyAuth('header', 'Authorization')
                ..apiKeyPrefix = 'Bearer'
                ..apiKey = apiKey))
          .listInstanceTypes();
    } on ApiException catch (e) {
      log('Failed to list instance types: ${e.message}', error: e);
      setState(() => _error = 'Could not log in: ${e.message}');
      return;
    }
    await _store.setApiKey(apiKey);
    if (context.mounted) context.go('/');
  }
}
