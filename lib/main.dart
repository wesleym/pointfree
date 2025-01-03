import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/platform/app.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/secrets.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _repository = FilesystemsRepository.instance;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    unawaited(_repository.update());

    return PlatformScaffold(
      body: StreamBuilder(
        initialData: _repository.filesystems,
        stream: _repository.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            log('Data unexpectedly missing; about to crash');
          }
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              switch (platform) {
                case TargetPlatform.iOS:
                case TargetPlatform.macOS:
                  return CupertinoListTile(title: Text(data[index].name));
                default:
                  return ListTile(title: Text(data[index].name));
              }
            },
          );
        },
      ),
    );
  }
}
