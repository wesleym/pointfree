import 'package:flutter/material.dart';
import 'package:lambda_gui/src/platform/app.dart';
import 'package:lambda_gui/src/router.dart';
import 'package:lambda_gui/src/secrets.dart';
import 'package:openapi/api.dart';

void main() {
  defaultApiClient = ApiClient(
      authentication: ApiKeyAuth('header', 'Authorization')
        ..apiKeyPrefix = 'Bearer'
        ..apiKey = apiKey);

  runApp(PlatformApp.router(
    title: 'Lambda Cloud',
    routerConfig: router,
  ));
}
