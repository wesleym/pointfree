import 'package:flutter/cupertino.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/ssh/list.dart';

class SshKeysPage extends StatelessWidget {
  const SshKeysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(body: SshKeysList());
  }
}
