import 'package:openapi/api.dart';

// TODO: Define store-level types rather than reusing the generated API types. This would allow customizing stringers and equality.

abstract class SshKeysStore {
  void put(SSHKey sshKey);
  void putAll(Iterable<SSHKey> sshKeys);
  SSHKey? get(String sshKeyId);
  Iterable<SSHKey> list();
  void delete(String sshKeyId);
}

class SshKeysMemoryStore implements SshKeysStore {
  static final instance = SshKeysMemoryStore();

  /// A mapping from ll SSH key ID to SSH key.
  final _sshKeys = <String, SSHKey>{};

  @override
  SSHKey? get(String sshKeyId) => _sshKeys[sshKeyId];

  @override
  List<SSHKey> list() => _sshKeys.values.toList(growable: false);

  @override
  void put(SSHKey sshKey) => _sshKeys[sshKey.id] = sshKey;

  @override
  void putAll(Iterable<SSHKey> sshKeys) {
    var sshKeyEntries = {for (final k in sshKeys) k.id: k};
    _sshKeys.addAll(sshKeyEntries);
  }

  @override
  void delete(String sshKeyId) => _sshKeys.remove(sshKeyId);
}
