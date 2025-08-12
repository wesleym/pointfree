import 'package:flutter/cupertino.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/ssh/list.dart';

class SshKeysPage extends StatelessWidget {
  const SshKeysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(body: SshKeysList());
  }
}
