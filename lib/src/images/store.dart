import 'package:openapi/api.dart';

// TODO: Define store-level types rather than reusing the generated API types. This would allow customizing stringers and equality.

abstract class ImagesStore {
  void put(Image instance);
  void putAll(Iterable<Image> instances);
  Image? get(String instanceId);
  Iterable<Image> list();
  void delete(String instanceId);
  void clear();
}

class ImagesMemoryStore implements ImagesStore {
  static final instance = ImagesMemoryStore();

  /// A mapping from instance ID to instance.
  final _images = <String, Image>{};

  @override
  Image? get(String instanceId) => _images[instanceId];

  @override
  List<Image> list() => _images.values.toList(growable: false);

  @override
  void put(Image instance) => _images[instance.id] = instance;

  @override
  void putAll(Iterable<Image> instances) {
    var instanceEntries = {for (final k in instances) k.id: k};
    _images.addAll(instanceEntries);
  }

  @override
  void delete(String instanceId) => _images.remove(instanceId);

  @override
  void clear() => _images.clear();
}
