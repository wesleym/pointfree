import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/login/store.dart';
import 'package:pointfree/src/platform/circular_progress_indicator.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/platform/text_button.dart';
import 'package:pointfree/src/theme_type_provider.dart';
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
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;
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
        Theme.of(context).textTheme.displaySmall,
    };
    final errorColor = switch (themeType) {
      ThemeType.cupertino => CupertinoColors.destructiveRed,
      ThemeType.material ||
      ThemeType.lambda =>
        Theme.of(context).colorScheme.error,
    };
    var progressIndicator = _inProgress
        ? AspectRatio(
            aspectRatio: 1, child: PlatformCircularProgressIndicator())
        : null;
    return PlatformScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text('Pointfree', style: apiKeyStyle),
            Text('for Lambda Cloud'),
            apiKeyField,
            if (_error != null)
              Text('Error: $_error', style: TextStyle(color: errorColor)),
            PlatformTextButton(
              onPressed: () => _setApiKey(context),
              child: Text('Set'),
            ),
            SizedBox(height: 48, child: progressIndicator),
          ],
        ),
      ),
    );
  }

  void _setApiKey(BuildContext context) async {
    setState(() {
      _error = null;
      _inProgress = true;
    });
    final apiKey = _apiKeyController.text;
    try {
      await InstancesApi(ApiClient(
              authentication: ApiKeyAuth('header', 'Authorization')
                ..apiKeyPrefix = 'Bearer'
                ..apiKey = apiKey))
          .listInstanceTypes();
    } on ApiException catch (e) {
      log('Failed to list instance types: ${e.message}', error: e);
      setState(() {
        _error = 'Could not log in: ${e.message}';
        _inProgress = false;
      });
      return;
    }
    await _store.setApiKey(apiKey);
    setState(() {
      _error = null;
      _inProgress = false;
    });
    if (context.mounted) context.go('/');
  }
}
