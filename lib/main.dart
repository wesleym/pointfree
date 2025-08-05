import 'package:flutter/material.dart';
import 'package:lambda_gui/app_container.dart';
import 'package:lambda_gui/src/secrets.dart';
import 'package:openapi/api.dart';

void main() {
  defaultApiClient = ApiClient(
      basePath: 'https://cloud.lambda.ai',
      authentication: ApiKeyAuth('header', 'Authorization')
        ..apiKeyPrefix = 'Bearer'
        ..apiKey = apiKey);

  runApp(AppContainer());
}
