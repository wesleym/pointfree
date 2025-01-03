import 'package:flutter/material.dart';
import 'package:lambda_gui/src/filesystems/list.dart';
import 'package:lambda_gui/src/platform/app.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/secrets.dart';
import 'package:lambda_gui/src/ssh/list.dart';
import 'package:openapi/api.dart';

void main() {
  defaultApiClient = ApiClient(
      authentication: ApiKeyAuth('header', 'Authorization')
        ..apiKeyPrefix = 'Bearer'
        ..apiKey = apiKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Lambda Cloud',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      builder: (context, index) {
        switch (index) {
          case 0:
            return Text('Instances go here');
          case 1:
            return FilesystemsList();
          case 2:
            return SshKeysList();
          default:
            return FilesystemsList();
        }
      },
    );
  }
}
