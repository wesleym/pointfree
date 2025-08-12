import 'dart:async';

import 'package:openapi/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _apiKeyKey = 'apiKey';

class LoginStore {
  static final instance = LoginStore._();

  LoginStore._() {
    _initSharedPrefs();
  }

  void _initSharedPrefs() async {
    var prefs = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(),
    );
    _prefs = prefs;
    if (_apiKey == null) {
      _apiKey = prefs.getString(_apiKeyKey);
      _apiKeyController.add(_apiKey);
    }
  }

  SharedPreferencesWithCache? _prefs;

  String? _apiKey;
  String? get apiKey => _apiKey;
  Future<void> setApiKey(String? apiKey) async {
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

    if (apiKey == null) {
      await _prefs?.remove(_apiKeyKey);
    } else {
      await _prefs?.setString(_apiKeyKey, apiKey);
    }
  }

  final _apiKeyController = StreamController<String?>.broadcast();
  Stream<String?> get apiKeyStream => _apiKeyController.stream;
}
