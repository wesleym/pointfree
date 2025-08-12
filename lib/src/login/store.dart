import 'dart:async';

import 'package:openapi/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _apiKeyKey = 'apiKey';

class LoginStore {
  static final instance = LoginStore._();

  LoginStore._()
      : _prefs = SharedPreferencesWithCache.create(
          cacheOptions: SharedPreferencesWithCacheOptions(),
        ) {
    _initSharedPrefs();
  }

  Future<void> _initSharedPrefs() async {
    final prefs = await _prefs;
    if (_apiKey == null) {
      _apiKey = prefs.getString(_apiKeyKey);
      _apiKeyController.add(_apiKey);
    }
    final apiKey = _apiKey;
    if (apiKey == null) {
      defaultApiClient = ApiClient(basePath: 'https://cloud.lambda.ai');
    } else {
      defaultApiClient = ApiClient(
          basePath: 'https://cloud.lambda.ai',
          authentication: ApiKeyAuth('header', 'Authorization')
            ..apiKeyPrefix = 'Bearer'
            ..apiKey = apiKey);
    }
  }

  Future<void> waitForReady() => _initSharedPrefs();

  final Future<SharedPreferencesWithCache> _prefs;

  String? _apiKey;
  String? get apiKey => _apiKey;
  Future<void> setApiKey(String? apiKey) async {
    await waitForReady();

    if (apiKey == null) {
      defaultApiClient = ApiClient(basePath: 'https://cloud.lambda.ai');
    } else {
      defaultApiClient = ApiClient(
          basePath: 'https://cloud.lambda.ai',
          authentication: ApiKeyAuth('header', 'Authorization')
            ..apiKeyPrefix = 'Bearer'
            ..apiKey = apiKey);
    }

    _apiKey = apiKey;
    _apiKeyController.add(apiKey);

    final prefs = await _prefs;

    if (apiKey == null) {
      await prefs.remove(_apiKeyKey);
    } else {
      await prefs.setString(_apiKeyKey, apiKey);
    }
  }

  final _apiKeyController = StreamController<String?>.broadcast();
  Stream<String?> get apiKeyStream => _apiKeyController.stream;
}
