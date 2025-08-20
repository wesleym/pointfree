import 'dart:async';
import 'dart:developer';

import 'package:pointfree/src/images/store.dart';
import 'package:lambda_cloud_dart_sdk/lambda_cloud_dart_sdk.dart';
import 'package:pointfree/src/login/store.dart';

const _ttl = Duration(minutes: 5);

class ImagesRepository {
  static final instance = ImagesRepository();

  final _store = ImagesMemoryStore.instance;
  var _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
  List<Image> get images => _store.list();
  final _controller = StreamController<List<Image>>.broadcast();
  Stream<List<Image>> get stream => _controller.stream;

  Future<void> update({bool force = false}) async {
    var now = DateTime.now();
    if (!force && _lastFetchTime.add(_ttl).isAfter(now)) return;

    await LoginStore.instance.waitForReady();

    final ListImages200Response images;
    try {
      final maybeImages = await ImagesApi(defaultApiClient).listImages();
      // This should never be null: an ApiException should have been thrown instead.
      images = maybeImages!;
    } on ApiException catch (e) {
      // TODO: Error handling.
      log('Failed to list images: ${e.message}');
      return;
    }

    _store
      ..clear()
      ..putAll(images.data);
    _controller.add(_store.list());
    _lastFetchTime = now;
  }
}
